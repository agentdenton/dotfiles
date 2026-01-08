fish_add_path -m ~/.local/bin
fish_add_path -m ~/.cargo/bin

fish_vi_key_bindings

set fish_greeting

# Theme
set -x fish_color_normal c6d0f5
set -x fish_color_command 8caaee
set -x fish_color_param eebebe
set -x fish_color_keyword e78284
set -x fish_color_quote a6d189
set -x fish_color_redirection f4b8e4
set -x fish_color_end ef9f76
set -x fish_color_comment 838ba7
set -x fish_color_error e78284
set -x fish_color_gray 737994
set -x fish_color_selection --background=414559
set -x fish_color_search_match --background=414559
set -x fish_color_option a6d189
set -x fish_color_operator f4b8e4
set -x fish_color_escape ea999c
set -x fish_color_autosuggestion 737994
set -x fish_color_cancel e78284
set -x fish_color_cwd e5c890
set -x fish_color_user 81c8be
set -x fish_color_host 8caaee
set -x fish_color_host_remote a6d189
set -x fish_color_status e78284
set -x fish_pager_color_progress 737994
set -x fish_pager_color_prefix f4b8e4
set -x fish_pager_color_completion c6d0f5
set -x fish_pager_color_description 737994

set -x FZF_DEFAULT_COMMAND "rg --files --no-ignore-vcs --hidden"
set -x FZF_DEFAULT_OPTS "-m --height 50%"
set -x FZF_DEFAULT_OPTS $FZF_DEFAULT_OPTS \
    "--color=bg+:#414559,bg:-1,spinner:#f2d5cf,hl:#e78284" \
    "--color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf" \
    "--color=marker:#f2d5cf,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284"

set -x EDITOR nvim
set -x VISUAL nvim
set -x EXA_STRICT 1
set -x BAT_THEME ansi
set -x BAT_PAGER "less -R"
set -x MANROFFOPT -c
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -x DEBUGINFOD_URLS ""

# Aliases
alias lg lazygit
alias ld lazydocker
alias hx helix
alias zel "zellij options --theme catppuccin-frappe"
alias bat "bat -p"
alias fd "fd --color=never"
alias clc clear
alias wcp wl-copy
alias cat bat
alias sctl systemctl
alias jctl journalctl
alias rgc "rg --color=always"
alias rmf "rm -rf -I"
alias cd z
alias cdi zi

alias mkin "sudo make install"
alias msd "meson setup build --buildtype debug"
alias msr "meson setup build --buildtype release"
alias nb "ninja -C build"
alias nc "ninja -C build clean"

alias toua "trans :uk "
alias toen "trans uk: "
alias dict "trans -d "

alias gc "git commit"
alias gca "git commit --amend"
alias gs "git status"
alias grv "git remote -v"
alias gba "git branch -a"
alias gck "git checkout"
alias gl "git log"
alias glp "git log -p"
alias gl1 "git log --oneline"
alias gbl "git blame"
alias gdp "git diff -p"
alias grh "git reset --hard"
alias grs "git reset --soft"
alias gclc "git clean -fdx"

alias fedit "$EDITOR $HOME/.config/fish/config.fish"
alias fsrc "source $HOME/.config/fish/config.fish"

if type -q exa
    alias l "exa -l --group-directories-first"
    alias ls "exa --group-directories-first"
    alias ll "exa -la --group-directories-first"
    alias lss "exa -l -s size"
    alias lsd "exa -l -s date"
    alias lst "exa -l -s size -T"
end

if type -q nvim
    alias vi="nvim"
    alias vim="nvim"
end

function vif
    set file (fd -t f | fzf)
    if test -n "$file"
        $EDITOR $file
    end
    commandline -f repaint
end

function cdf --argument depth
    set dir (fd -I | fzf)
    if test -n "$dir"
        cd $dir
    end
    commandline -f repaint
end

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

if type -q zoxide
    zoxide init fish | source
end

if type -q starship
    starship init fish | source
end

if type -q direnv
    direnv hook fish | source
end

bind --mode insert --user ctrl-f vif
bind --mode insert --user ctrl-y y

if status is-interactive
    # Commands to run in interactive sessions can go here
end

set private_repo_path ~/.dotfiles/dotfiles-private
set private_fish_variables "$private_repo_path/fish/variables.fish"

if test -f $private_fish_variables
    source $private_fish_variables
else
    echo "Warning: Private $private_fish_variables doesn't exist."
end
