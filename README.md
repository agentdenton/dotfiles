# Dotfiles

## Install

```
# install configs as symlinks
./install.sh symlink

# or as copies
./install.sh copy
```

### Install packages

```
sudo pacman -S - < core_pkg.txt
```

### Install fonts, themes, etc.

```
paru -S - < paru_pkg.txt
```

#### Install starship-rs

```
sh -c "$(curl -fsSL https://starship.rs/install.sh)"
```
