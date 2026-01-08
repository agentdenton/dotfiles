#!/usr/bin/bash -e

export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
export FZF_DEFAULT_OPTS="-m --height 50%"
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS" \
    --color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284 \
    --color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf \
    --color=marker:#f2d5cf,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284"

help() {
  echo "Usage: $0 [--all]"
  echo "  --all: Stop all active WireGuard interfaces without prompting."
}

if [[ "$1" == "--help" || "$1" == "-h" ]]; then
  help
  exit 0
fi

stop_all=$1
active_interfaces=$(wg | grep 'interface' | awk '{print $2}')
if [ ! -z "$active_interfaces" ]; then
    if [ "$stop_all" == "--all" ]; then
        selected_interfaces=($active_interfaces) 
    else
        selected_interfaces=($(echo "$active_interfaces" | fzf))
    fi
    if [ ! -z "${selected_interfaces[*]}" ]; then
        for interface in "${selected_interfaces[@]}"; do
            echo "Stopping $interface..." && echo ""
            wg-quick down ${interface}
            # systemctl stop "wg-quick@${interface}.service"
        done
    fi
fi
