set -o vi

alias lg="lazygit"
alias vim="nvim"
alias nnn="nnn -e"
alias xcy="xclip"
alias xcp="xclip -o"
alias tmux="tmux -2"

export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
export FZF_DEFAULT_OPTS="-m --height 50% --border"
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color fg:#D8DEE9,bg:#2E3440,hl:#A3BE8C,fg+:#D8DEE9,bg+:#434C5E,hl+:#A3BE8C
--color pointer:#BF616A,info:#4C566A,spinner:#4C566A,header:#4C566A,prompt:#81A1C1,marker:#EBCB8B'

export NNN_FIFO=/tmp/nnn.fifo
export NNN_PLUG='f:finder;o:fzopen;p:mocplay;d:diffs;t:nmount;v:imgview'
export NNN_FCOLORS="0B0B04060006060009060B06"

export MANPAGER="nvim -c 'set ft=man' -"

export EXA_STRICT=1
export BAT_THEME="Nord"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export EDITOR=nvim
export VISUAL=nvim

eval "$(starship init bash)"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
