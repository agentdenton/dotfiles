#!/bin/bash

set -e

INSTALL_DIR=/usr/local/bin
DOTS_DIR=~/.dotfiles

if [[ $(pwd) != $DOTS_DIR ]]; then
    echo "Run this script from $DOTS_DIR"
    exit
fi

function usage() {
    echo "Usage: $0 [OPTIONS]"
    echo "  -a      install everything"
    echo "  -c      install configs only"
    echo "  -s      install scripts only"
    echo "  -h      display this message"
}

function install_home_configs() {
    echo "Installing home configs..."
    local home_configs=(bashrc tmux.conf vimrc xinitrc)
    for conf in ${home_configs[@]}; do
        rm -rf ~/.$conf
        cp $conf ~/.$conf
    done
    echo "Home configs installed!"
}

function install_configs() {
    echo "Installing configs..."
    local configs=(i3 rofi dunst zathura polybar alacritty nvim flameshot starship.toml)
    for conf in ${configs[@]}; do
        rm -rf ~/.config/$conf
        cp -r $conf ~/.config
    done
    echo "Configs installed!"
}

function install_nnn() {
    echo "Installing nnn..."

    mkdir -p ~/git_repos
    if [[ ! -d ~/git_repos/nnn ]]; then
        git clone https://github.com/jarun/nnn.git ~/git_repos/nnn
    fi

    cd ~/git_repos/nnn
    # remove annoying arrow in detailed mode
    sed -i 's/addstr(MD_ARROW_FORWARD);//' src/nnn.c
    make O_NERD=1
    sudo make install
    cd -

    echo "nnn installed!"
}

function install_scripts() {
    echo "Installing scripts..."
    sudo cp -r scripts/* $INSTALL_DIR
    echo "Scripts are installed!"
}

SHORT=a,c,s,p,h
OPTS=$(getopt -n qqq -o $SHORT -- "$@")
if [[ $? -ne 0 ]]; then
    echo "Failed to parse command line arguments" >&2
    exit 1
fi

eval set -- "$OPTS"
unset OPTS

# TODO: create an array of tuples ('prog_name', install_function)
while true; do
    case "$1" in
        '-a')
            install_home_configs
            install_configs
            install_nnn
            install_scripts

            shift
            break
        ;;
        '-c')
            install_home_configs
            install_configs

            shift
            continue
        ;;
        '-s')
            install_scripts

            shift
            continue
        ;;
        '-p')
            install_nnn

            shift
            continue
        ;;
        '-h')
            usage

            shift
            continue
        ;;
        '--')
            usage

            shift
            break
        ;;
        *)
            echo "Failed to iterate command line arguments" >&2
            exit 1
        ;;
    esac
done
