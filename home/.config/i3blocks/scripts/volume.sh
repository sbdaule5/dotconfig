
#!/bin/sh

VOLUME_MUTE="󰖁 "
VOLUME_ZERO="󰝟 "
VOLUME_LOW="󰕿 "
VOLUME_MID="󰖀 "
VOLUME_HIGH="󰕾 "
SOUND_LEVEL=$(amixer -M get Master | awk -F"[][]" '/%/ { print $2 }' | awk -F"%" 'BEGIN{tot=0; i=0} {i++; tot+=$1} END{printf("%s\n", tot/i) }')
MUTED=$(amixer get Master | awk ' /%/{print ($NF=="[off]" ? 1 : 0); exit;}')

ICON=$VOLUME_MUTE
if [ "$MUTED" = "1" ]
then
    ICON="$VOLUME_MUTE"
else
    if [ "$SOUND_LEVEL" -eq 0 ]
    then
        ICON="$VOLUME_ZERO"
    elif [ "$SOUND_LEVEL" -lt 34 ]
    then
        ICON="$VOLUME_LOW"
    elif [ "$SOUND_LEVEL" -lt 67 ]
    then
        ICON="$VOLUME_MID"
    else
        ICON="$VOLUME_HIGH"
    fi
fi

if [ "$SOUND_LEVEL" -lt 101 ]
then
    echo -e "<span color='#282828' bgcolor='#E7A927' bgalpha='90%'> $ICON<b>$SOUND_LEVEL%</b> </span>"
else
    echo -e "<span color='#282828' bgcolor='#E72727' bgalpha='90%'> $ICON<b>$SOUND_LEVEL%</b> </span>"
fi

# Doing acitons when buttons are pressed
if [ -n $button ]; then
    if [ $button -eq 1 ]; then
        pactl set-sink-mute @DEFAULT_SINK@ toggle
    elif [ $button -eq 3 ]
    then
        PID=$(pgrep -a alacritty | grep Mixer | awk '{print $1}')
        if [ -z $PID ]; then
            i3-msg exec "alacritty --class="Alacritty:Mixer" -e ncpamixer" > /dev/null
        else
            kill $PID
        fi
    elif [ $button -eq 4 ]
    then
        pactl set-sink-volume @DEFAULT_SINK@ -01%
    elif [ $button -eq 5 ]
    then
        pactl set-sink-volume @DEFAULT_SINK@ +01%
    fi
fi

