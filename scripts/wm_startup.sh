#!/bin/bash

function start_app() { killall "$1"; eval "$1 $2" & }

xset r rate 400 100
setxkbmap -model pc105 -layout us,ua -variant qwerty -option grp:win_space_toggle

start_app "dunst"
start_app "flameshot"
start_app "polybar" "top_bar"
start_app "xss-lock" "--transfer-sleep-lock -- i3lock -c 1e2127 --nofork"
start_app "feh" "--bg-scale ~/pictures/wallpapers/onedark_triangles.png"
