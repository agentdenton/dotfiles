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

# export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANPAGER="less -s -M +Gg"

export EXA_STRICT=1
export BAT_THEME="base16"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export EDITOR="nvim"
export VISUAL="nvim"

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias lg="lazygit"
alias vi="nvim"
alias vim="nvim"
alias hx="helix"
alias bat="bat -p"
alias fd="fd --color=never"
alias nnn="nnn -e -U"
alias clc="clear"

alias cd="z"
alias cdi="zi"

alias mkin="sudo make install"

alias l="exa -l -s extension --icons"
alias ls="exa -s extension --icons"
alias ll="exa -la -s extension --icons"
alias lss="exa -l -s size --icons"
alias lsd="exa -l -s date --icons"
alias lst="exa -l -s size --icons -T"

alias bsrc="source ~/.bashrc"
alias bedit="$EDITOR ~/.bashrc"

alias todo="$EDITOR ~/todo.md"
alias notes="$EDITOR ~/notes.md"

alias tua="trans :uk "
alias teng="trans uk: "
alias tdict="trans -d "

alias gc="git commit"
alias gca="git commit --amend"

alias gs="git status"
alias grv="git remote -v"
alias gba="git branch -a"

alias gl="git log"
alias glp="git log -p"
alias gl1="git log --oneline"
alias gwhat="git log --diff-filter=A --"

alias gbl="git blame"
alias gdp="git diff -p"

alias grh="git reset --hard"
alias grs="git reset --soft"

alias gclc="git clean -fdx"

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

vif() {
  local file=$(fd -t f | fzf)
  if [[ -n "$file" ]]; then
    ${EDITOR:-vim} "$file"
  fi
}

cdf() {
  local dir=$(fd -t d | fzf)
  if [[ -n $dir ]]; then
    cd $dir
  fi
}

manf() {
  local tmp=$(man -k . | fzf | awk '{print $1 " " $2}')
  if [[ -n $tmp ]]; then
    local page=$(echo $tmp | awk '{print $1}')
    local type=$(echo $tmp | awk '{print $2}')
    man $type $page
  fi
}

is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

vifg() {
  is_in_git_repo || return
  local file=$(git status | grep "modified:" | awk '{print $2}' | fzf);
  if [ -n "$file" ]; then
    ${EDITOR:-vi} "$file"
  fi
}

fgb() {
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

bind -x '"\C-n":"ncd"'
bind -x '"\C-f":"vif"'

eval "$(starship init bash)"
eval "$(zoxide init bash)"
