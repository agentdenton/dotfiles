set -U fish_color_normal normal
set -U fish_color_command 81a1c1
set -U fish_color_quote a3be8c
set -U fish_color_redirection b48ead
set -U fish_color_end 88c0d0
set -U fish_color_error ebcb8b
set -U fish_color_param eceff4
set -U fish_color_comment 5e81ac
set -U fish_color_match --background=brblue
set -U fish_color_selection white --bold --background=brblack
set -U fish_color_search_match bryellow --background=brblack
set -U fish_color_history_current --bold
set -U fish_color_operator 00a6b2
set -U fish_color_escape 00a6b2
set -U fish_color_cwd green
set -U fish_color_cwd_root red
set -U fish_color_valid_path --underline
set -U fish_color_autosuggestion 5e81ac
set -U fish_color_user brgreen
set -U fish_color_host normal
set -U fish_color_cancel -r
set -U fish_pager_color_completion normal
set -U fish_pager_color_description B3A06D yellow
set -U fish_pager_color_prefix white --bold --underline
set -U fish_pager_color_progress brwhite --background=cyanset -x EXA_STRICT 1

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
