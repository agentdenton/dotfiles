#!/usr/bin/python

import sys
import argparse
from subprocess import run

def install_configs() -> None:
    cmds = [
        'ln -fns ~/.dotfiles/bashrc ~/.bashrc',
        'ln -fns ~/.dotfiles/vimrc ~/.vimrc',
        'ln -fns ~/.dotfiles/nvim ~/.config',
        'ln -fns ~/.dotfiles/sway ~/.config',
        'ln -fns ~/.dotfiles/waybar ~/.config',
        'ln -fns ~/.dotfiles/rofi ~/.config',
        'ln -fns ~/.dotfiles/ranger ~/.config',
        'ln -fns ~/.dotfiles/zathura ~/.config',
        'ln -fns ~/.dotfiles/starship.toml ~/.config/starship.toml',
        'ln -fns ~/.dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml',
    ]
    for cmd in cmds:
        run(cmd, check=True, shell=True)

def install_scripts() -> None:
    cmds = [
        'sudo cp services/* /etc/systemd/system/'
    ]
    for cmd in cmds:
        run(cmd, check=True, shell=True)

def install_services() -> None:
    cmds = [
        'sudo cp scripts/* /usr/local/bin'
    ]
    for cmd in cmds:
        run(cmd, check=True, shell=True)

def main() -> None:
    variants = {
        'all': (lambda: None),
        'configs': install_configs,
        'scripts': install_scripts,
        'services': install_services,
    }
    parser = argparse.ArgumentParser()
    parser.add_argument(
        'variants',
        nargs='+',
        type=str,
        help=f'Possible variants {list(variants.keys())}'
    )
    args = parser.parse_args()
    if 'all' in args.variants:
        for fn in variants.values():
            fn()
    else:
        for var in args.variants:
            if var not in variants:
                print(f'Invalid arg: {var}')
                sys.exit(1)
            variants[var]()

if __name__ == '__main__':
    main()
