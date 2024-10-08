source ~/.config/fish/theme.fish
source ~/.config/fish/alises.fish
source ~/.config/fish/env_vars.fish
source ~/.config/fish/funcs.fish

if status is-interactive
    # Commands to run in interactive sessions can go here
end

if type -q zoxide
    zoxide init fish | source
end

if type -q starship
    starship init fish | source
end

fish_add_path $HOME/.local/bin $PATH
fish_add_path $HOME/.cargo/bin $PATH

fish_vi_key_bindings

bind --mode insert --user \cn ncd
bind --mode insert --user \cf vif
bind --mode insert --user \c] cdf
