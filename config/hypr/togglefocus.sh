#!/usr/bin/sh

floating=$(hyprctl activewindow -j | jq '.floating')

if [ "$floating" = 'true' ]; then
  hyprctl dispatch cyclenext tiled
else
  hyprctl dispatch cyclenext floating
fi
