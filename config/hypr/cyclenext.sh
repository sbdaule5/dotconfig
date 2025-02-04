#!/usr/bin/sh

floating=$(hyprctl activewindow -j | jq '.floating')

if [ "$floating" = 'true' ]; then
  hyprctl dispatch cyclenext "$1" floating
else
  if [ "$1" = 'prev' ]; then
    hyprctl dispatch layoutmsg cycleprev
  else
    hyprctl dispatch layoutmsg cyclenext
  fi
fi
