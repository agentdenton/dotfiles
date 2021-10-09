#!/usr/bin/bash

rm -rf $HOME/.bashrc
rm -rf $HOME/.tmux.conf
rm -rf $HOME/.config/starship.toml

cp bash/bashrc $HOME/.bashrc
cp starship.toml $HOME/.config/starship.toml
cp tmux.conf $HOME/.tmux.conf
cp -r scripts/* /usr/bin/

configs=(i3 rofi dunst zathura polybar alacritty nvim flameshot)
for conf in ${configs[@]}; do
    # clean old configs
    rm -rf $HOME/.config/$conf
    # copy new configs
    cp -r $conf $HOME/.config/
done
