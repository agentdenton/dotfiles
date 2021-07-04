set -x EXA_STRICT 1
set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8
set -x EDITOR nvim
set -x VISUAL nvim
set -x MANPAGER "nvim -c 'set ft=man' -"

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
alias oni="/home/agent_denton/github/oni2/_esy/release/install/bin/Oni2 & disown"

fish_vi_key_bindings
set fish_greeting
starship init fish | source
