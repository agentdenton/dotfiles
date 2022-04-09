#!/bin/sh

cp ~/.bashrc ~/.dotfiles/bashrc
cp ~/.xinitrc ~/.dotfiles/xinitrc
cp ~/.vimrc ~/.dotfiles/vimrc
cp ~/.tmux.conf ~/.dotfiles/tmux.conf
cp ~/.config/starship.toml ~/.dotfiles

cp -r ~/.config/i3 ~/.dotfiles/config
cp -r ~/.config/i3status ~/.dotfiles/config
cp -r ~/.config/alacritty ~/.dotfiles/config
cp -r ~/.config/dunst ~/.dotfiles/config
cp -r ~/.config/nvim ~/.dotfiles/config
cp -r ~/.config/rofi ~/.dotfiles/config
