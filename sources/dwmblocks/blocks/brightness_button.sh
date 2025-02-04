#!/bin/sh

case "$1" in
    4) brillo -U 0.5 ;;
    5) brillo -A 0.5 ;;
esac
pkill -RTMIN+8 dwmblocks
