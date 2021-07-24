# Setup fzf
# ---------
if [[ ! "$PATH" == */home/agent_denton/github/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/agent_denton/github/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/agent_denton/github/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/agent_denton/github/fzf/shell/key-bindings.zsh"
