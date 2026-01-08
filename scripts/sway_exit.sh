#!/bin/sh

choices="shutdown\nreboot\nexit\n"

res=$(printf $choices | rofi -dmenu)
if [[ $res == "shutdown" ]]; then
  systemctl poweroff
elif [[ $res == "reboot" ]]; then
  systemctl reboot
elif [[ $res == "exit" ]]; then
  swaymsg exit
fi
