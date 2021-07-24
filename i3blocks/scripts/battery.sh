#!/bin/bash

bat=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep "power supply");

if [[ $bat == *"no"* ]]; then
    echo "bat: no";
elif [[ $bat == *"yes"* ]]; then
    perc=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep "percentage" | tr -dc '0-9');
    echo " bat: $perc% ";
fi

