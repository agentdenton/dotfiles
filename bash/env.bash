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
# export BAT_THEME="Nord"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export EDITOR="nvim"
export VISUAL="nvim"
