#!/bin/bash

confirm_exit() {
    rofi -dmenu -i -no-fixed-num-lines -p "Are You Sure?: "
}

msg() {
    rofi -e "Available Options - y / n"
}

poweroff="PowerOff"
reboot="Reboot"
logout="Logout"

opt="$poweroff\n$reboot\n$logout\n"
var=$(echo -e "$opt" | rofi -lines 3 -dmenu)

case $var in
    $poweroff)
        ans=$(confirm_exit &)
        if [[ $ans == "y" ]]; then
            systemctl poweroff
        elif [[ $ans == "n" ]]; then
            exit 0
        else
            msg
        fi

        ;;
    $reboot)
        ans=$(confirm_exit &)
        if [[ $ans == "y" ]]; then
            systemctl reboot
        elif [[ $ans == "n" ]]; then
            exit 0
        else
            msg
        fi

        ;;
    $logout)
        ans=$(confirm_exit &)
        if [[ $ans == "y" ]]; then
            killall bspwm
        elif [[ $ans == "n" ]]; then
            exit 0
        else
            msg
        fi
        ;;
    *)
        echo "Please type "y" or "n""
        ;;
esac
