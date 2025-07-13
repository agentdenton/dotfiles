#!/usr/bin/env python3

import pathlib

DOTFILES_DIR = pathlib.Path.home() / ".dotfiles"
HOME = pathlib.Path.home()

LINKS = {
    f"{DOTFILES_DIR}/bashrc":                   f"{HOME}/.bashrc",
    f"{DOTFILES_DIR}/zshrc":                    f"{HOME}/.zshrc",
    f"{DOTFILES_DIR}/vimrc":                    f"{HOME}/.vimrc",
    f"{DOTFILES_DIR}/inputrc":                  f"{HOME}/.inputrc",
    f"{DOTFILES_DIR}/gitconfig":                f"{HOME}/.gitconfig",
    f"{DOTFILES_DIR}/config.fish":              f"{HOME}/.config/config.fish",
    f"{DOTFILES_DIR}/mimeapps.list":            f"{HOME}/.config/mimeapps.list",
    f"{DOTFILES_DIR}/starship.toml":            f"{HOME}/.config/starship.toml",
    f"{DOTFILES_DIR}/nvim/init.lua":            f"{HOME}/.config/nvim/init.lua",
    f"{DOTFILES_DIR}/helix/config.toml":        f"{HOME}/.config/helix/config.toml",
    f"{DOTFILES_DIR}/wezterm/wezterm.lua":      f"{HOME}/.config/wezterm/wezterm.lua",
}

def install_dots():
    for src, dest in LINKS.items():
        src_path = pathlib.Path(src)
        dest_path = pathlib.Path(dest)

        dest_path.parent.mkdir(parents=True, exist_ok=True)
        dest_path.unlink(missing_ok=True)

        print(f"Linking {src_path} -> {dest_path}")
        dest_path.symlink_to(src_path)


if __name__ == "__main__":
    install_dots()
