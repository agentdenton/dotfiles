#!/bin/bash

xset r rate 400 100
setxkbmap -model pc105 -layout us,ua -variant qwerty -option grp:win_space_toggle
# xrandr --output DVI-D-1 --primary --left-of HDMI-0

# close all open apps
apps=(dunst flameshot xss-lock polybar feh)
for app in ${apps[@]}; do
    killall $app
done

dunst &
flameshot &
polybar top_bar &
xss-lock --transfer-sleep-lock -- i3lock -i ~/pictures/lock_screen/retro_anime_girl.png --nofork &
feh --bg-scale $HOME/pictures/wallpapers/retro_anime_girl.png
