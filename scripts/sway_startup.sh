#!/usr/bin/bash

chown -R agent_denton:agent_denton /sys/class/backlight/amdgpu_bl0/brightness
chown -R agent_denton:agent_denton /sys/class/leds/asus::kbd_backlight/brightness

chmod +w /sys/class/backlight/amdgpu_bl0/brightness
chmod +w /sys/class/leds/asus::kbd_backlight/brightness
