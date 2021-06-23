# fzf
export FZF_DEFAULT_OPTS="rg --files"
export FZF_DEFAULT_OPTS="-m --height 50% --border"

# NNN
export NNN_FIFO=/tmp/nnn.fifo
export NNN_PLUG='f:finder;o:fzopen;p:mocplay;d:diffs;t:nmount;v:imgview'
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
 --color=fg:#dedede,bg:-1,hl:#666666
 --color=fg+:#eeeeee,bg+:-1,hl+:#cf73e6
 --color=info:#cf73e6,prompt:#FF0000,pointer:#cf73e6
 --color=marker:#f0d50c,spinner:#cf73e6,header:#91aadf'

# zephyr
export ZEPHYR_BASE="$HOME/zephyrproject/zephyr"

# paths
export PATH="$HOME/.cargo/env:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/Programs/fzf/bin:$PATH"
export MANPAGER="nvim -c 'set ft=man' -"

# other
export EXA_STRICT=1
export BAT_THEME="base16"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR=nvim
export VISUAL=nvim

# alias
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
alias UU="sudo pacman -Syu"
alias njc="ninja -C build clean"
alias njb="clear && ninja -C build"
alias mcb="meson . build --cross-file=cross.ini"
alias mcbd="meson . build --cross-file=cross.ini --buildtype=debug"
alias mcbr="meson . build --cross-file=cross.ini --buildtype=release"

# toolchains
export PATH="$HOME/Toolchains/arm-none-eabi/bin:$PATH"
export PATH="$HOME/Toolchains/riscv-linux/bin:$PATH"
