#!/usr/bin/sh

killall waybar
waybar > "$XDG_STATE_HOME"/waybar.log 2>&1

killall hyprpaper
hyprpaper

swaync-client -R
swaync-client -rs
