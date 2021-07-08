set -x EXA_STRICT 1
set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8
set -x EDITOR nvim
set -x VISUAL nvim
set -x MANPAGER "nvim -c 'set ft=man' -"
set -x FZF_DEFAULT_OPTS "-m --height 50% --border"
set -x FZF_DEFAULT_OPTS "--color fg:#D8DEE9,bg:#2E3440,hl:#A3BE8C,fg+:#D8DEE9,bg+:#434C5E,hl+:#A3BE8C" $FZF_DEFAULT_OPTS
set -x FZF_DEFAULT_OPTS "--color pointer:#BF616A,info:#4C566A,spinner:#4C566A,header:#4C566A,prompt:#81A1C1,marker:#EBCB8B" $FZF_DEFAULT_OPTS

alias lg="lazygit"
alias ls="exa"
alias ll="exa -la"
alias l="exa -l"
alias vim="nvim"
alias za="zathura"
alias nnn="nnn -e"
alias xcy="xclip"
alias xcp="xclip -o"
alias wb="west build"
alias wf="west flash"
alias njc="ninja -C build clean"
alias njb="clear && ninja -C build"
alias mcb="meson . build --cross-file=cross.ini"
alias mcbd="meson . build --cross-file=cross.ini --buildtype=debug"
alias mcbr="meson . build --cross-file=cross.ini --buildtype=release"

fish_vi_key_bindings
set fish_greeting
starship init fish | source
