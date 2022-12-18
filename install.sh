#!/bin/sh

set -e

ln -fns ~/.dotfiles/bashrc ~/.bashrc
ln -fns ~/.dotfiles/vimrc ~/.vimrc
ln -fns ~/.dotfiles/nvim ~/.config
ln -fns ~/.dotfiles/sway ~/.config
ln -fns ~/.dotfiles/waybar ~/.config
ln -fns ~/.dotfiles/rofi ~/.config
ln -fns ~/.dotfiles/starship.toml ~/.config/starship.toml
ln -fns ~/.dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml

sudo cp scripts/* /usr/local/bin
sudo cp services/* /etc/systemd/system/
