ncd() {
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

vif() {
  local file=$(fd | fzf)
  if [ -n "$file" ]; then
    ${EDITOR:-vim} "$file"
  fi
}

is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
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
