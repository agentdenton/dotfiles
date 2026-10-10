#!/usr/bin/sh

chown -R $USER /sys/class/backlight/amdgpu_bl0/brightness
chown -R $USER /sys/class/leds/asus::kbd_backlight/brightness

chmod +w /sys/class/backlight/amdgpu_bl0/brightness
chmod +w /sys/class/leds/asus::kbd_backlight/brightness
