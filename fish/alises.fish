alias lg "lazygit"
alias hx "helix"
alias zel "zellij options --theme catppuccin-frappe"
alias bat "bat -p"
alias fd "fd --color=never"
alias nnn "nnn -e -U -A"
alias clc "clear"
alias wcp "wl-copy"

alias make "make | less -R"
alias mkin "sudo make install"
alias msd "meson setup build --buildtype debug"
alias msr "meson setup build --buildtype release"
alias nb "ninja -C build"
alias nc "ninja -C build clean"

alias todo "$EDITOR ~/todo.md"
alias notes "$EDITOR ~/notes.md"

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

