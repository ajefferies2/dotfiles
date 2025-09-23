#!/usr/bin/env bash
set -euo pipefail
echo "I don't like my nvim synlinked, so its just getting copied into .config."
echo "please run this from dotfiles/ I havent tested elsewhere."

repo_dir="$(cd "$(dirname "$0")" && pwd)"

dot_dirs=("i3" "alacritty" "ranger")
dot_files=(".bashrc")

default_packer_dir="${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/pack/packer/start/packer.nvim"
default_config_dir="${XDG_CONFIG_HOME:-$HOME/.config}/nvim/"

read -rp "Enter packer install directory [${default_packer_dir}]: " input
packer_dir="${input:-$default_packer_dir}"
read -rp "Enter Neovim config directory [${default_config_dir}]: " input
config_dir="${input:-$default_config_dir}"

echo "Using packer directory: $packer_dir"
echo "Using config directory: $config_dir"

if [ ! -d "$packer_dir" ]; then
  echo "Installing packer.nvim..."
  git clone --depth 1 https://github.com/wbthomason/packer.nvim "$packer_dir"
else
  echo "packer.nvim is already present."
fi

if [ -d "$config_dir" ] && [ "$(ls -A "$config_dir")" ]; then
  read -rp "Directory $config_dir contains existing files. Delete and continue? [y/N] " confirm
  if [[ "$confirm" =~ ^[Yy]$ ]]; then
    echo "Removing existing files in $config_dir..."
    rm -rf "${config_dir:?}/"*
  else
    echo "Aborted. Existing configuration left intact."
    exit 1
  fi
fi

echo "Creating config directory at $config_dir"
mkdir -p "$config_dir"

echo "Copying Neovim configuration..."
if command -v rsync >/dev/null 2>&1; then
  rsync -a --exclude='.git' "$repo_dir/nvim/" "$config_dir"
else
  cp -a "$repo_dir/nvim/." "$config_dir"
fi

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

