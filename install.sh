#!/bin/sh

set -e

usage() {
  echo -e "USAGE: $0 [OPTIONS]"
  echo -e "OPTIONS:"
  echo -e "\tcopy\t copy the configuration"
  echo -e "\tsymlink\t symlink the configuration"
}

dots_dir="~/.dotfiles"
if [[ $(dirs) != $dots_dir ]]; then
  echo "Run this script from $dots_dir"
  exit 1
fi

# install configs
if [[ "$1" == "symlink" ]]; then
  echo "Symlinking..."

  ln -fns ~/.dotfiles/bashrc ~/.bashrc
  ln -fns ~/.dotfiles/tmux.conf ~/.tmux.conf
  ln -fns ~/.dotfiles/vimrc ~/.vimrc
  ln -fns ~/.dotfiles/starship.toml ~/.config/starship.toml
  ln -fns ~/.dotfiles/xinitrc ~/.xinitrc
  ln -fns ~/.dotfiles/Xresources ~/.Xresources

  ln -fns ~/.dotfiles/config/alacritty ~/.config
  ln -fns ~/.dotfiles/config/dunst ~/.config
  ln -fns ~/.dotfiles/config/i3 ~/.config
  ln -fns ~/.dotfiles/config/i3status ~/.config
  ln -fns ~/.dotfiles/config/nvim ~/.config
  ln -fns ~/.dotfiles/config/qtile ~/.config
  ln -fns ~/.dotfiles/config/rofi ~/.config
  ln -fns ~/.dotfiles/config/zathura ~/.config
elif [[ "$1" == "copy" ]]; then
  echo "Copying..."

  cp bashrc ~/.bashrc
  cp tmux.conf ~/.tmux.conf
  cp vimrc ~/.vimrc
  cp starship.toml ~/.config
  cp xinitrc ~/.xinitrc
  cp Xresources ~/.Xresources

  cp -r config/* ~/.config
else
  echo -e "Invalid argument\n"
  usage
  exit 1
fi

sudo cp scripts/* /usr/local/bin

echo "Installation finished"
