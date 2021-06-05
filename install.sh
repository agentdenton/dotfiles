#!/bin/bash

rm -rf ~/.zshrc
rm -rf ~/.config/rofi
rm -rf ~/.config/dunst
rm -rf ~/.config/zathura
rm -rf ~/.config/alacritty
rm -rf ~/.config/starship.toml

mkdir -p ~/.config
mkdir -p ~/.config/rofi
mkdir -p ~/.config/dunst
mkdir -p ~/.config/zathura
mkdir -p ~/.config/alacritty

ln -s ~/.dotfiles/nvim ~/.config/
ln -s ~/.dotfiles/zsh/zshrc ~/.zshrc
ln -s ~/.dotfiles/dunstrc ~/.config/dunst/dunstrc
ln -s ~/.dotfiles/starship.toml ~/.config/starship.toml
ln -s ~/.dotfiles/zathurarc ~/.config/zathura/zathurarc
ln -s ~/.dotfiles/config.rasi ~/.config/rofi/config.rasi
ln -s ~/.dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml
