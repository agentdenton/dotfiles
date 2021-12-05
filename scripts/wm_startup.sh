#!/bin/bash

xset r rate 400 100
setxkbmap -model pc105 -layout us,ua -variant qwerty -option grp:win_space_toggle

# array of apps to start
cmds=()
cmds+=("dunst")
cmds+=("flameshot")
cmds+=("polybar top_bar")
cmds+=("xss-lock --transfer-sleep-lock -- i3lock -c 000000 --nofork")
cmds+=("feh --bg-scale $HOME/pictures/wallpapers/retro_anime_girl_gimped.png")

# auto start apps with arguments, key = arg, vals[key] = app name
for cmd in "${cmds[@]}"; do
    # kill all apps that is running
    app=$(echo $cmd | awk '{split($0,app," "); print app[1]}')
    killall $app
    # execute app startup cmd
    $cmd &
done
