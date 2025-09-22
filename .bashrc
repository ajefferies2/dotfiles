# ~/.bashrc
#
set -o vi
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

export PS1="\u@\h:\w\$ "
# PS1='[\u@\h \W]\$ '
export EDITOR=nvim 
export VISUAL=nvim

[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

export PATH=$PATH:/opt/SEGGER/JLink_Linux_V856a_x86_64

eval "$(direnv hook bash)"
echo "Hello, bash!"
