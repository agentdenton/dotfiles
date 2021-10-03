#!/usr/bin/bash

rm -rf $HOME/.bashrc
rm -rf $HOME/.tmux.conf
rm -rf $HOME/.config/starship.toml

cp bash/bashrc $HOME/.bashrc
cp starship.toml $HOME/.config/starship.toml
cp tmux.conf $HOME/.tmux.conf

configs=(i3 rofi dunst zathura polybar alacritty nvim flameshot)

# clean old configs
for conf in ${configs[@]}; do
    rm -rf $HOME/.config/$conf
done

# copy new configs
for conf in ${configs[@]}; do
    cp -r $conf $HOME/.config
done

# copy scripts to binaries dir
cp -r scripts/* /usr/bin/
