#!/usr/bin/bash -eu

export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
export FZF_DEFAULT_OPTS="-m --height 50%"
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS" \
    --color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284 \
    --color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf \
    --color=marker:#f2d5cf,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284"

paths=$(ls -l /etc/wireguard/*.conf)
conf_file_names=$(echo "$paths" | awk '{print $NF}' | xargs -I {} basename {} .conf)
if [ ! -z "$conf_file_names" ]; then
    conf_files=($(echo "$conf_file_names" | fzf))
    if [ ! -z "${conf_file[*]}" ]; then
        if [ ! -z "$(wg)" ]; then
            echo "Error. Another VPN connection is already active"
            exit 1
        fi
    fi
    for interface in "${conf_files[@]}"; do
        echo "Starting $interface..." && echo ""
        wg-quick up ${interface}
        # systemctl start "wg-quick@${interface}.service"
    done
fi
