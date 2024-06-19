[ -f ~/.fzf.bash ] && source ~/.fzf.bash

set -o vi
shopt -s histverify

export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
export FZF_DEFAULT_OPTS="-m --height 50%"
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS" \
--color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284 \
--color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf \
--color=marker:#f2d5cf,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284"

export NNN_FIFO=/tmp/nnn.fifo
export NNN_PLUG='f:finder;o:fzopen;p:mocplay;d:diffs;t:nmount;v:imgview'
export NNN_FCOLORS="0B0B04060006060009060B06"
export NNN_TMPFILE="/tmp/lastd"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export EDITOR="nvim"
export VISUAL="nvim"

export EXA_STRICT=1
export BAT_THEME="ansi"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Fix broken escape codes for the man-pages after upgrading from groff-1.22.4-10
# to groff-1.23.0-2. See: https://bbs.archlinux.org/viewtopic.php?id=287185
export GROFF_NO_SGR=1

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

export DEBUGINFOD_URLS=""

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias lg="lazygit"
alias hx="helix"
alias zel="zellij options --theme catppuccin-frappe"
alias bat="bat -p"
alias fd="fd --color=never"
alias nnn="nnn -e -U -A"
alias ranger="ranger --choosedir=$HOME/.rangerdir"
alias clc="clear"

alias mkin="sudo make install"
alias msd="meson setup build --buildtype debug"
alias msr="meson setup build --buildtype release"
alias nb="ninja -C build"
alias nc="ninja -C build clean"

alias bsrc="source ~/.bashrc"
alias bedit="$EDITOR ~/.bashrc"

alias todo="$EDITOR ~/todo.txt"
alias notes="$EDITOR ~/notes.txt"

alias toua="trans :uk "
alias toen="trans uk: "
alias dict="trans -d "

alias gc="git commit"
alias gca="git commit --amend"
alias gs="git status"
alias grv="git remote -v"
alias gba="git branch -a"
alias gck="git checkout"
alias gdiff="git diff"
alias gl="git log"
alias glp="git log -p"
alias gl1="git log --oneline"
alias gshow="git show"
alias gwhat="git log --diff-filter=A --"
alias gbl="git blame"
alias gdp="git diff -p"
alias grh="git reset --hard"
alias grs="git reset --soft"
alias gclc="git clean -fdx"

alias profile="gdb_profile"
alias get_env="get_environment"

alias bl-off="bluetoothctl power off"
alias bl-on="bluetoothctl power on"
if [[ -x $(command -v exa) ]]; then
    alias l="exa -l --group-directories-first"
    alias ls="exa --group-directories-first"
    alias ll="exa -la --group-directories-first"
    alias lss="exa -l -s size"
    alias lsd="exa -l -s date"
    alias lst="exa -l -s size -T"
fi

if [[ -x $(command -v zoxide) ]]; then
    alias cd="z"
    alias cdi="zi"

    eval "$(zoxide init bash)"
fi

if [[ -x $(command -v nvim) ]]; then
    alias vi="nvim"
    alias vim="nvim"
fi

if [[ -x $(command -v starship) ]]; then
    eval "$(starship init bash)"
fi

ncd() {
    # Block nesting of nnn in subshells
    if [[ -n $NNNLVL ]] && [[ "${NNNLVL:-0}" -ge 1 ]]; then
        echo "nnn is already running"
        return
    fi

    nnn "$@"
    if [[ -f "$NNN_TMPFILE" ]]; then
        . "$NNN_TMPFILE"
        rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

rng() {
    ranger
    if [[ -f $HOME/.rangerdir ]]; then
        cd $(cat $HOME/.rangerdir)
    fi
}

vif() {
    local file=$(fd -t f | fzf)
    if [[ -n "$file" ]]; then
        ${EDITOR:-vim} "$file"
    fi
}

cdf() {
    local dir=$(fd -I -t d --max-depth 1 | fzf)
    if [[ -n $dir ]]; then
        cd $dir
    fi
}

exf() {
    local file=$(fd -t f --max-depth 1| fzf)
    local exe_perm=$(ls -la $file | cut -d ' ' -f 1 | grep -o . | sed '4q;d')
    if [[ $exe_perm == 'x' ]]; then
        ./$file
    fi
}

is_in_git_repo() {
    git rev-parse HEAD > /dev/null 2>&1
}

gvif() {
    is_in_git_repo || return
    local file=$(git status | grep "modified:" | awk '{print $2}' | fzf);
    if [ -n "$file" ]; then
        ${EDITOR:-vi} "$file"
    fi
}

gcf() {
    is_in_git_repo || return
    branch=$(git branch --color=always --all --sort=-committerdate |
        grep -v HEAD |
        fzf --height 50% --ansi --no-multi |
        sed "s/.* //"
    )
    if [[ "$branch" = "" ]]; then
        echo "No branch selected."
        return
    fi
    if [[ "$branch" = 'remotes/'* ]]; then
        git checkout --track $branch
    else
        git checkout $branch;
    fi
}

gdb_profile() {
  nsamples=1
  sleeptime=0
  pid=$1

  echo -e "\nOutput:"

  for x in $(seq 1 $nsamples)
  do
    gdb -ex "set pagination 0" -ex "thread apply all bt" --batch -p $pid
    sleep $sleeptime
  done | \
  awk '
    BEGIN { s = ""; }
    /^Thread/ { print s; s = ""; }
    /^#/ { if (s != "" ) { s = s "," $4} else { s = $4 } }
    END { print s }' | \
  sort | uniq -c | sort -r -n -k 1,1
}

get_environment() {
    if [ -z "$1" ]; then
        echo "ERROR: Please provide a PID as an argument."
        return 1
    fi
    cat "/proc/$1/environ" | tr '\0' '\n' | cut -d ':' -f 1-
}

bind -x '"\C-f":"vif"'
bind -x '"\C-n":"ncd"'

eval "$(starship init bash)"
