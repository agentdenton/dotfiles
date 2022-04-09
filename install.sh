#!/bin/sh

set -e

dots_dir=~/.dotfiles
if [[ $(pwd) != $dots_dir ]]; then
    echo "Run this script from $dots_dir"
    exit 1
fi

cp bashrc ~/.bashrc
cp tmux.conf ~/.tmux.conf
cp vimrc ~/.vimrc
cp starship.toml ~/.config
cp xinitrc ~/.xinitrc
cp Xresources ~/.Xresources
cp -r config/* ~/.config
