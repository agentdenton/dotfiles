#!/bin/sh

set -e

dots_dir="~/.dotfiles"
if [[ $(dirs) != $dots_dir ]]; then
  echo "Run this script from $dots_dir"
  exit 1
fi

ln -fns ~/.dotfiles/bashrc ~/.bashrc
ln -fns ~/.dotfiles/starship.toml ~/.config/starship.toml
ln -fns ~/.dotfiles/vimrc ~/.vimrc
ln -fns ~/.dotfiles/nvim ~/.config
