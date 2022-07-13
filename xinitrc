#!/bin/sh

xset s 300 5
xset r rate 400 100
xsetroot -cursor_name left_ptr
setxkbmap -model pc105 -layout us,ua -variant qweety \
  -option grp:win_space_toggle

num_of_mon=$(xrandr | grep -w connected | wc -l)
if [[ $num_of_mon -gt 1 ]]; then
  xrandr --output DisplayPort-0 --primary --left-of eDP
  xrandr --output DisplayPort-0 --mode 3440x1440 --rate 144
fi

exec i3
