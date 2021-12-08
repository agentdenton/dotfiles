## Dotfiles

### Install programs (Arch Linux)
```
paru -S alacritty vim neovim curl bat ripgrep fd exa flameshot zathura \
    htop xclip feh lazygit mpv i3 dunst xss-lock rofi \
    tmux picom polybar font-manager lxappearance-gtk3
```

### Install fonts
```
paru -S ttf-font-awesome nerd-fonts-terminus nerd-fonts-roboto-mono \
    adobe-source-han-sans-jp-fonts tamzen-font
```

### Install themes
```
paru -S volantes-cursors papirus-icon-theme lightdm-webkit2-greeter
```

### Install starship-rs
```
sh -c "$(curl -fsSL https://starship.rs/install.sh)"
```

### Run install script
```
./install.sh
```
