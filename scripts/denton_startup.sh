#!/usr/bin/bash

setxkbmap -option caps:swapescape
setxkbmap -model pc105 -layout us,ua -variant qwerty -option grp:win_space_toggle

xset r rate 400 100
# xrandr --output DVI-D-1 --primary --left-of HDMI-0

dunst &
flameshot &
xss-lock --transfer-sleep-lock -- i3lock -c 000000 --nofork &
feh --bg-scale $HOME/Pictures/wallpapers/rengoku_cool.jpg
