#!/bin/sh

choices="shutdown\nreboot\nexit\n"
res=$(printf $choices | rofi -dmenu)
if [[ $res == "shutdown" ]]; then
  systemctl poweroff
elif [[ $res == "reboot" ]]; then
  systemctl reboot
elif [[ $res == "exit" ]]; then
  i3-msg exit
else
  rofi -e "No action provided"
fi
