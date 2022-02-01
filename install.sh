#!/bin/sh

set -e

INSTALL_DIR=/usr/local/bin
DOTS_DIR=~/.dotfiles

if [[ $(pwd) != $DOTS_DIR ]]; then
    echo "Run this script from $DOTS_DIR"
    exit 1
fi

cp bashrc ~/.bashrc
cp tmux.conf ~/.tmux.conf
cp vimrc ~/.vimrc
cp inputrc ~/.inputrc
cp xinitrc ~/.xinitrc
cp Xresources ~/.Xresources

cp starship.toml ~/.config
cp -r config/* ~/.config

sudo cp -r scripts/* $INSTALL_DIR
