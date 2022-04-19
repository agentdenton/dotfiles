alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias prm="sudo pacman -R"
alias pinst="sudo pacman -S"
alias pupdt="sudo pacman -Syu"
alias pquery="pacman -Q"

alias lg="lazygit"
alias vi="nvim"
alias nnn="nnn -e -U"
alias tmux="tmux -2"
alias clc="clear"

alias bsrc="source ~/.bashrc"
alias bedit="$EDITOR ~/.bashrc"

alias todo="$EDITOR ~/TODO.md"
alias notes="$EDITOR ~/NOTES.md"

alias gc="git commit"
alias gca="git commit --amend"

alias gs="git status"
alias grv="git remote -v"
alias gba="git branch -a"

alias gl="git log"
alias glp="git log -p"
alias gl1="git log --oneline"

alias gbl="git blame"
alias gdp="git diff -p"

alias grh="git reset --hard"
alias grs="git reset --soft"

alias gst="git stash"
alias gstp="git stash pop"

alias gpull="git pull"
alias gclc="git clean -fdx"

alias yy="xclip -i -selection clipboard -rmlastnl"
alias pp="xclip -o -selection clipboard"

alias l="exa -l -s extension --icons"
alias ls="exa -s extension --icons"
alias ll="exa -la -s extension --icons"
alias lss="exa -l -s size --icons"
alias lsd="exa -l -s date --icons"
alias lst="exa -l -s size --icons -T"

alias cd="z"
alias cdi="zi"

alias mkin="sudo make install"

alias wb="west build"
alias wf="west flash"

alias njc="ninja -C build clean"
alias njb="clear && ninja -C build"

alias mcb="meson . build --cross-file=cross.ini"
alias mcbd="meson . build --cross-file=cross.ini --buildtype=debug"
alias mcbr="meson . build --cross-file=cross.ini --buildtype=release"
