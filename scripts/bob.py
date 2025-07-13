#!/usr/bin/env python3

import os
import pwd
import shutil
import pathlib
import argparse
import subprocess

def home_dir():
    """Gets the real user's home directory, even when run with sudo."""
    sudo_user = os.environ.get("SUDO_USER")
    if sudo_user:
        return pathlib.Path(pwd.getpwnam(sudo_user).pw_dir)
    else:
        return pathlib.Path.home()

DOTFILES_DIR = home_dir() / ".dotfiles"
HOME = home_dir()

LINKS = {
    f"{DOTFILES_DIR}/bashrc":                   f"{HOME}/.bashrc",
    f"{DOTFILES_DIR}/zshrc":                    f"{HOME}/.zshrc",
    f"{DOTFILES_DIR}/vimrc":                    f"{HOME}/.vimrc",
    f"{DOTFILES_DIR}/inputrc":                  f"{HOME}/.inputrc",
    f"{DOTFILES_DIR}/gitconfig":                f"{HOME}/.gitconfig",
    f"{DOTFILES_DIR}/config.fish":              f"{HOME}/.config/fish/config.fish",
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

def install_scripts():
    dest = "/usr/local/bin"
    scripts_dir_path = DOTFILES_DIR / "scripts"
    try:
        for item in scripts_dir_path.iterdir():
            if item.is_dir():
                for file in item.iterdir():
                    if file.is_file():
                        shutil.copy2(file, dest)
            else:
                shutil.copy2(item, dest)
    except PermissionError:
        print(f"Error: Permission denied.")

def install_pacman_packages():
    cfg_path = DOTFILES_DIR / "pacman" / "denton-lp.txt"
    command = ["pacman", "-S", "--needed", "--noconfirm", "-"]
    try:
        with open(cfg_path, 'r') as f:
            subprocess.run(command, stdin=f, check=True, text=True)
    except subprocess.CalledProcessError as e:
        if "you cannot perform this operation unless you are root" in e.stderr:
            print(f"Error: Permission denied.")

def install_flatpaks():
    cfg_path = DOTFILES_DIR / "flatpak" / "denton-lp.txt"
    with open(cfg_path, 'r') as f:
        flatpak_ids = [line.strip() for line in f if line.strip()]
    command = ["flatpak", "install", "flathub", "--assumeyes"] + flatpak_ids
    try:
        with open(cfg_path, 'r') as f:
            subprocess.run(command, check=True, text=True)
    except:
        print("Error. Failed to install flatpaks")

def main():
    p = argparse.ArgumentParser(
        prog="bob",
        description="Utility to manage personal configurations",
    )
    sb = p.add_subparsers(dest="command", metavar="")
    install = sb.add_parser(
        "install",
        help="Install one or more components."
    )
    install.add_argument(
        "component",
        nargs="+",
        choices=["dots", "scripts", "packages", "flatpaks"],
        help="Select one or more components to install",
        metavar="",
    )
    args = p.parse_args()
    if args.command == "install":
        if "dots" in args.component:
            print("Installing dotfiles...")
            install_dots()
        if "scripts" in args.component:
            print("Installing scripts...")
            install_scripts()
        if "packages" in args.component:
            print("Installing pacman packages...")
            install_pacman_packages()
        if "flatpaks" in args.component:
            print("Installing flatpaks...")
            install_flatpaks()

if __name__ == "__main__":
    main()
