#!/bin/sh

set -e

dots_dir="~/.dotfiles"
if [[ $(dirs) != $dots_dir ]]; then
  echo "Run this script from $dots_dir"
  exit 1
fi

sudo pacman -S - < core_pkg.txt
sudo cp scripts/* /usr/local/bin

ln -fns ~/.dotfiles/bash/bashrc ~/.bashrc
ln -fns ~/.dotfiles/vimrc ~/.vimrc
ln -fns ~/.dotfiles/starship.toml ~/.config/starship.toml

ln -fns ~/.dotfiles/config/sway ~/.config
ln -fns ~/.dotfiles/config/alacritty ~/.config
ln -fns ~/.dotfiles/config/nvim ~/.config
ln -fns ~/.dotfiles/config/rofi ~/.config
ln -fns ~/.dotfiles/config/zathura ~/.config
