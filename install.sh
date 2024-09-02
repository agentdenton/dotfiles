#!/bin/sh

ln -fns ~/.dotfiles/bashrc ~/.bashrc
ln -fns ~/.dotfiles/zshrc ~/.zshrc
ln -fns ~/.dotfiles/gitconfig ~/.gitconfig
ln -fns ~/.dotfiles/inputrc ~/.inputrc
ln -fns ~/.dotfiles/vimrc ~/.vimrc
# ln -fns ~/.dotfiles/nvim ~/.config/nvim
ln -fns ~/.dotfiles/nvim/lazynvim/config ~/.config/nvim/lua/config
ln -fns ~/.dotfiles/nvim/lazynvim/plugins ~/.config/nvim/lua/plugins
ln -fns ~/.dotfiles/fish/config.fish ~/.config/fish/config.fish
ln -fns ~/.dotfiles/helix ~/.config/helix
ln -fns ~/.dotfiles/sway ~/.config/sway
ln -fns ~/.dotfiles/waybar ~/.config/waybar
ln -fns ~/.dotfiles/rofi ~/.config/rofi
ln -fns ~/.dotfiles/ranger ~/.config/ranger
ln -fns ~/.dotfiles/zathura ~/.config/zathura
ln -fns ~/.dotfiles/zellij ~/.config/zellij
ln -fns ~/.dotfiles/starship.toml ~/.config/starship.toml
ln -fns ~/.dotfiles/alacritty ~/.config/alacritty
ln -fns ~/.dotfiles/wezterm ~/.config/wezterm
ln -fns ~/.dotfiles/dunst ~/.config/dunst

cp environment /etc/environment

# install fisher
# curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

# install fzf.fish
# fisher install PatrickF1/fzf.fish
