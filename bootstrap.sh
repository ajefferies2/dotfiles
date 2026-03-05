#!/usr/bin/env bash
set -euo pipefail
echo "please run this from dotfiles/ I havent tested elsewhere."

repo_dir="$(cd "$(dirname "$0")" && pwd)"

dot_dirs=("i3" "alacritty" "ranger" "nvim")
dot_files=(".bashrc" ".xinitrc")


for dir in "${dot_dirs[@]}"; do
  target="$HOME/.config/$dir"
  if [ -e "$target" ]; then
    read -rp "$target exists. Overwrite with repo version? [y/N] " confirm
    if [[ "$confirm" =~ ^[Yy]$ ]]; then
      rm -rf "$target"
      ln -s "$repo_dir/$dir" "$target"
    else
      echo "Skipped $target"
    fi
  else
    ln -s "$repo_dir/$dir" "$target"
  fi
done

for file in "${dot_files[@]}"; do
  target="$HOME/$file"
  if [ -e "$target" ]; then
    read -rp "$target exists. Overwrite with repo version? [y/N] " confirm
    if [[ "$confirm" =~ ^[Yy]$ ]]; then
      rm -f "$target"
      ln -s "$repo_dir/$file" "$target"
    else
      echo "Skipped $target"
    fi
  else
    ln -s "$repo_dir/$file" "$target"
  fi
done

echo "Dotfiles bootstrap complete."

