#!/usr/bin/bash

setxkbmap -option caps:swapescape
setxkbmap -model pc105 -layout us,ua -variant qwerty -option grp:win_space_toggle

xset r rate 400 100
# xrandr --output DVI-D-1 --primary --left-of HDMI-0

function start_apps {
    # close all open apps
    apps=(dunst flameshot xss-lock)
    for app in ${apps[@]}; do
        killall $app
    done

    dunst &
    flameshot &
    xss-lock --transfer-sleep-lock -- i3lock -i ~/pictures/lock_screen/space_man.png --nofork &
    feh --bg-scale $HOME/pictures/wallpapers/space_man.jpg
}

start_apps
