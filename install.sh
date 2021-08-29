#!/bin/bash

rm -rf $HOME/.bashrc
rm -rf $HOME/.config/starship.toml

cp bash/bashrc $HOME/.bashrc
cp starship/starship.toml $HOME/.config/starship.toml

configs=(i3 rofi dunst zathura polybar alacritty nvim)

# clean old configs
for conf in ${configs[@]}; do
    rm -rf $HOME/.config/$conf
done

# copy new configs
for conf in ${configs[@]}; do
    cp -r $conf $HOME/.config
done
