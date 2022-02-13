source ~/.dotfiles/bash/fzf-completion.bash
source ~/.dotfiles/bash/fzf-key-bindings.bash

set -o vi

set completion-query-items 500

### environment variables

export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
export FZF_DEFAULT_OPTS="-m --height 50% --border"
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=fg:#c5cdd9,bg:#121212,hl:#6cb6eb
--color=fg+:#c5cdd9,bg+:#1e2127,hl+:#5dbbc1
--color=info:#88909f,prompt:#98c379,pointer:#d38aea
--color=marker:#a0c980,spinner:#ec7279,header:#5dbbc1'

export NNN_FIFO=/tmp/nnn.fifo
export NNN_PLUG='f:finder;o:fzopen;p:mocplay;d:diffs;t:nmount;v:imgview'
export NNN_FCOLORS="0B0B04060006060009060B06"
export NNN_TMPFILE="/tmp/lastd"

export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export EXA_STRICT=1
export BAT_THEME="ansi"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export EDITOR="nvim"
export VISUAL="nvim"

export _ZO_DATA_DIR=~/

### aliases

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

alias pacrm="sudo pacman -R"
alias pacinst="sudo pacman -S"
alias pacupd="sudo pacman -Syu"
alias pacls="pacman -Q"

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
alias gb="git branch"
alias gba="git branch -a"
alias gl="git log"
alias glp="git log -p"
alias gl1="git log --oneline"
alias gch="git checkout"
alias gbl="git blame"
alias gsh="git show"
alias grh="git reset --hard"
alias grs="git reset --soft"
alias gdp="git diff -p"
alias gst="git stash"
alias gstp="git stash pop"
alias gpull="git pull"
alias gclc="git clean -fdx"

alias yy="xclip -i -selection clipboard -rmlastnl"
alias pp="xclip -o -selection clipboard"

alias l="exa -l -s extension --icons"
alias ls="exa -s extension --icons"
alias ll="exa -la -s extension --icons"
alias la="exa -a -s extension --icons"
alias lsa="exa -a -s extension --icons"
alias lse="exa -l -s extension --icons"
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

### nnn

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

### vim

vim_fzf() {
    local file=$(fd | fzf)
    if [ -n "$file" ]; then
        ${EDITOR:-vim} "$file"
    fi
}

### git

is_in_git_repo() {
    git rev-parse HEAD > /dev/null 2>&1
}

fgchb() {
    git rev-parse HEAD > /dev/null 2>&1 || return
    git checkout "$(git branch -a --color=always | fzf | tr -d ' ')"
}

fgchc() {
    git log --oneline --color=always \
        | fzf --ansi --no-sort --reverse --tiebreak=index \
        | grep -o "[a-f0-9]\{7,\}" \
        | tr -d ' ' \
        | xargs git checkout
}

fgsh() {
    is_in_git_repo || return
    git log --oneline --date=short --color=always \
        | fzf --ansi --no-sort --reverse --multi \
            -m --height 100% --border sharp --preview \
            'grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git show --color=always' \
        | grep -o "[a-f0-9]\{7,\}" > /dev/null
}

fgst() {
    is_in_git_repo || return
    git stash list | fzf --reverse -d: --preview 'git show --color=always {1}' \
        | cut -d: -f1
}

bind -x '"\C-t": vim_fzf'

eval "$(starship init bash)"
eval "$(zoxide init bash)"
