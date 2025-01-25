#!/usr/bin/env python

import os
import shutil

DOTFILES_DIR = os.path.expanduser("~/.dotfiles")

configs = {
    "bashrc": "~/.bashrc",
    "zshrc": "~/.zshrc",
    "gitconfig": "~/.gitconfig",
    "inputrc": "~/.inputrc",
    "vimrc": "~/.vimrc",
    "nvim": "~/.config/nvim",
    "fish": "~/.config/fish",
    "helix": "~/.config/helix",
    "sway": "~/.config/sway",
    "waybar": "~/.config/waybar",
    "rofi": "~/.config/rofi",
    "zathura": "~/.config/zathura",
    "zellij": "~/.config/zellij",
    "starship.toml": "~/.config/starship.toml",
    "alacritty": "~/.config/alacritty",
    "wezterm": "~/.config/wezterm",
    "dunst": "~/.config/dunst",
    "mimeapps.list": "~/.config/mimeapps.list",
}

def symlink(src, dst):
    src = os.path.join(DOTFILES_DIR, src)
    dst = os.path.expanduser(dst)

    if not os.path.exists(src):
        print(f"Error: Source file not found: {src}")
        return

    if os.path.exists(dst) or os.path.islink(dst):
        print(f"Removing existing file/symlink: {dst}")
        if os.path.isdir(dst) and not os.path.islink(dst):
            shutil.rmtree(target_path)
        else:
            os.remove(dst)

    # Create parent directories if they don't exist
    os.makedirs(os.path.dirname(dst), exist_ok=True)

    # Create the symlink
    print(f"Creating symlink: {src} -> {dst}")
    os.symlink(src, dst)

for src, dst in configs.items():
    symlink(src, dst)
