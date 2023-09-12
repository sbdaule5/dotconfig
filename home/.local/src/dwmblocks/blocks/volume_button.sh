#!/bin/sh

case "$1" in
    1) pactl set-sink-mute @DEFAULT_SINK@ toggle ;;
    2) pactl set-sink-volume @DEFAULT_SINK@ 50% ;;
    3)
        PID=$(pgrep -a alacritty | grep ncpamixer | awk '{print $1}')
        if [ -z $PID ]; then
            setsid -f alacritty --class="Alacritty:Mixer" -e ncpamixer > /dev/null
        else
            kill -n 3 $PID
        fi
        ;;
    4) pactl set-sink-volume @DEFAULT_SINK@ -01% ;;
    5) pactl set-sink-volume @DEFAULT_SINK@ +01% ;;
esac
pkill -RTMIN+4 dwmblocks
