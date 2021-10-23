#!/usr/bin/bash

DOTS_DIR=$HOME/.dotfiles
if [[ $(pwd) != $DOTS_DIR ]]; then
    echo "Run this script from $DOTS_DIR"
    exit
fi

rm -rf $HOME/.bashrc
rm -rf $HOME/.tmux.conf
rm -rf $HOME/.config/starship.toml

cp bash/bashrc $HOME/.bashrc
cp starship.toml $HOME/.config/starship.toml
cp tmux.conf $HOME/.tmux.conf
sudo cp -r scripts/* /usr/bin/

echo "Installing configs..."
configs=(i3 rofi dunst zathura polybar alacritty nvim flameshot)
for conf in ${configs[@]}; do
    # clean old configs
    rm -rf $HOME/.config/$conf
    # copy new configs
    cp -r $conf $HOME/.config/
done

echo "Installing nnn..."
if [[ -d $HOME/github/nnn ]]; then
    echo "NNN dir already exists!"
    echo "Compiling nnn..."
    cd $HOME/github/nnn && O_NERD=1 O_ICONS=1 make && sudo make install && cd -
else
    mkdir -p $HOME/github
    git clone https://github.com/jarun/nnn.git $HOME/github/nnn
    cd $HOME/github/nnn && O_NERD=1 O_ICONS=1 make && sudo make install && cd -
fi
