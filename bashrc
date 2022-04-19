set -o vi
set completion-query-items 500

source ~/.dotfiles/bash/fzf-completion.bash
source ~/.dotfiles/bash/fzf-key-bindings.bash

source ~/.dotfiles/bash/exports.bash
source ~/.dotfiles/bash/aliases.bash
source ~/.dotfiles/bash/functions.bash

eval "$(starship init bash)"
eval "$(zoxide init bash)"

test -r ~/.dotfiles/bash/nord_dir_colors && \
  eval $(dircolors ~/.dotfiles/bash/nord_dir_colors)
