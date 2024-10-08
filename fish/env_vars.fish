set fish_greeting

set -x FZF_DEFAULT_COMMAND "rg --files --no-ignore-vcs --hidden"
set -x FZF_DEFAULT_OPTS "-m --height 50%"
set -x FZF_DEFAULT_OPTS $FZF_DEFAULT_OPTS \
    "--color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284" \
    "--color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf" \
    "--color=marker:#f2d5cf,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284"

set -x NNN_FIFO /tmp/nnn.fifo
set -x NNN_PLUG 'f:finder;o:fzopen;p:mocplay;d:diffs;t:nmount;v:imgview'
set -x NNN_FCOLORS "0B0B04060006060009060B06"
set -x NNN_TMPFILE "/tmp/lastd"

set -x EDITOR nvim
set -x VISUAL nvim

set -x EXA_STRICT 1

set -x BAT_THEME ansi

# set -x LESS "-R"
set -x MANROFFOPT "-c"
set -x MANPAGER "bat -l man -p"

set -x DEBUGINFOD_URLS ""

