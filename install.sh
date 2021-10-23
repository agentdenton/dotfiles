#!/usr/bin/bash

set -e

DOTS_DIR=$HOME/.dotfiles
if [[ $(pwd) != $DOTS_DIR ]]; then
    echo "Run this script from $DOTS_DIR"
    exit
fi

mkdir -p $HOME/github

rm -rf $HOME/.bashrc
rm -rf $HOME/.tmux.conf
rm -rf $HOME/.config/starship.toml

cp bash/bashrc $HOME/.bashrc
cp starship.toml $HOME/.config/starship.toml
cp tmux.conf $HOME/.tmux.conf

echo "Installing configs..."
configs=(i3 rofi dunst zathura polybar alacritty nvim flameshot)
for conf in ${configs[@]}; do
    # clean old configs
    rm -rf $HOME/.config/$conf
    # copy new configs
    cp -r $conf $HOME/.config/
done
echo "Configs installed!"

echo "Installing nnn..."
if [[ ! -d $HOME/github/nnn ]]; then
    git clone https://github.com/jarun/nnn.git $HOME/github/nnn
fi

cd $HOME/github/nnn
# remove annoying arrow in detailed mode
sed -i 's/addstr(MD_ARROW_FORWARD);//' src/nnn.c
make O_NERD=1
sudo make install
cd -
echo "NNN installed!"

sudo cp -r scripts/* /usr/bin/
