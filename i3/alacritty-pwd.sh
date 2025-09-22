#!/usr/bin/env bash
#
# Spawn Alacritty in the CWD of the focused Alacritty shell, else $HOME,
# with debug logging so you can tail -f /tmp/i3-alacritty-here.log.

LOG=/tmp/i3-alacritty-here.log
echo "[$(date +'%H:%M:%S')] → script start" >>"$LOG"

# absolute paths
XDO=/usr/bin/xdotool
XPR=/usr/bin/xprop
RLN=/usr/bin/readlink
ALC=/usr/bin/alacritty

# 1) get window ID
WIN=$($XDO getactivewindow 2>>"$LOG" || echo "")
echo "  win_id=$WIN" >>"$LOG"

# 2) get WM_CLASS
WM=$($XPR -id "$WIN" WM_CLASS 2>>"$LOG" | grep -o 'Alacritty' || echo "")
echo "  wm_class=$WM" >>"$LOG"

# default to HOME
cwd="$HOME"

if [[ $WM == "Alacritty" ]]; then
  # 3) get Alacritty’s PID
  PID=$($XPR -id "$WIN" _NET_WM_PID 2>>"$LOG" | awk '{print $3}' || echo "")
  echo "  pid=$PID" >>"$LOG"

  if [[ -n $PID ]]; then
    # 4) pick the first child (your shell)
    CHILD=$(pgrep -P "$PID" | head -n1)
    TARGET=${CHILD:-$PID}
    echo "  target_pid=$TARGET" >>"$LOG"

    # 5) resolve cwd
    cwd=$($RLN -f "/proc/$TARGET/cwd" 2>>"$LOG" || echo "$HOME")
    echo "  resolved cwd=$cwd" >>"$LOG"
  fi
fi

# 6) Finally exec Alacritty (no & here!)
echo "  launching alacritty in $cwd" >>"$LOG"
exec "$ALC" --working-directory "$cwd" "$@"

