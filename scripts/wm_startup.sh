#!/bin/bash

xset r rate 400 100
setxkbmap -model pc105 -layout us,ua -variant qwerty -option grp:win_space_toggle

# a dictionary of apps to start-restart with their input arguments
declare -A apps=(
    ["dunst"]=""
    ["flameshot"]=""
    ["polybar"]="top_bar"
    ["xss-lock"]="--transfer-sleep-lock -- i3lock -i ~/pictures/lock_screen/retro_anime_girl.png --nofork"
    ["feh"]="--bg-scale $HOME/pictures/wallpapers/retro_anime_girl.png"
)

# auto start apps with arguments, key = arg, vals[key] = app name
for app in "${!apps[@]}"; do
    killall $app
    $app "${apps[$app]}" &
done
