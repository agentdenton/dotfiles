#!/usr/bin/sh

sudo pacman -S --noconfirm --needed just git
git clone https://github.com/agentdenton/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
just install
