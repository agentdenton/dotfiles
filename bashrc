source ~/.dotfiles/bash/fzf-completion.bash
source ~/.dotfiles/bash/fzf-key-bindings.bash

set -o vi
set completion-query-items 500

export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
export FZF_DEFAULT_OPTS="-m --height 50% --border"
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
 --color=fg:#c9d1d9,bg:#1f2428,hl:#c9d1d9
 --color=fg+:#51afef,bg+:-1,hl+:#ef99f3
 --color=info:#b083f0,prompt:#3b8eea,pointer:#3b8eea
 --color=marker:#f14c4c,spinner:#3b8eea,header:#a5a5a5'

export NNN_FIFO=/tmp/nnn.fifo
export NNN_PLUG='f:finder;o:fzopen;p:mocplay;d:diffs;t:nmount;v:imgview'
export NNN_FCOLORS="0B0B04060006060009060B06"
export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

export _ZO_DATA_DIR=~/

export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export EXA_STRICT=1
export BAT_THEME="ansi"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export EDITOR="nvim"
export VISUAL="nvim"

alias ..="cd .."
alias lg="lazygit"
alias vim="nvim"
alias nnn="nnn -e -U"
alias tmux="tmux -2"
alias bshsrc="source ~/.bashrc"
alias clc="clear"
alias todo="vim ~/TODO.md"
alias notes="vim ~/NOTES.md"

alias yy="xclip -i -selection clipboard -rmlastnl"
alias pp="xclip -o -selection clipboard"

alias l="exa -l -s extension --icons"
alias ls="exa -s extension --icons "
alias ll="exa -la -s extension --icons"
alias lse="exa -l -s extension --icons"
alias lss="exa -l -s size --icons"
alias lst="exa -l -s size --icons -T"

alias cd="z"
alias cdi="zi"

alias wb="west build"
alias wf="west flash"

alias njc="ninja -C build clean"
alias njb="clear && ninja -C build"

alias mcb="meson . build --cross-file=cross.ini"
alias mcbd="meson . build --cross-file=cross.ini --buildtype=debug"
alias mcbr="meson . build --cross-file=cross.ini --buildtype=release"

ncd () {
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    nnn "$@"
    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

vim_fzf() {
    local file=$(fd | fzf)
    if [ -n "$file" ]; then
        ${EDITOR:-vim} "$file"
    fi
}

bind -x '"\C-t": vim_fzf'
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

eval "$(starship init bash)"
eval "$(zoxide init bash)"
