#!/bin/sh

BRIGHTNESS_HIGH="󰃚"
BRIGHTNESS_MID="󰃛"
BRIGHTNESS_LOW="󰃜"
BRIGHTNESS=$(brillo | cut -d'.' -f1)

ICON=$VOLUME_MUTE

if [ "$BRIGHTNESS" -lt 34 ]
then
    ICON="$BRIGHTNESS_LOW"
elif [ "$BRIGHTNESS" -lt 67 ]
then
    ICON="$BRIGHTNESS_MID"
else
    ICON="$BRIGHTNESS_HIGH"
fi

echo -e "$ICON $BRIGHTNESS% | "
