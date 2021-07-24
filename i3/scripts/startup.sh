#!/bin/bash

setxkbmap -option caps:swapescape
setxkbmap -model pc105 -layout us,ua -variant qwerty -option grp:win_space_toggle

xset r rate 400 70
xrandr --output DVI-D-1 --primary --left-of HDMI-0
