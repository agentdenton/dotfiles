set -o vi
shopt -s histverify

prefix="$HOME/.dotfiles/bash"
test -r $prefix/env.bash && source $prefix/env.bash
test -r $prefix/aliases.bash && source $prefix/aliases.bash
test -r $prefix/func.sh && source $prefix/func.sh
test -r $prefix/nord_dir_colors.bash && \
  eval $(dircolors ~/.dotfiles/bash/nord_dir_colors.bash)

test -f ~/.fzf.bash && source ~/.fzf.bash
test -r $HOME/.cargo/env && source $HOME/.cargo/env

eval "$(starship init bash)"
eval "$(zoxide init bash)"

