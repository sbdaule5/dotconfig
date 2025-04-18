#!/usr/bin/bash

entry="$(cliphist list | rofi -dmenu -display-columns 2 -kb-custom-1 'Alt+d')";

if [ "$?" -eq 0 ]; then
    echo "$entry" | cliphist decode | wl-copy;
else
    echo "$entry" | cliphist delete;
fi
