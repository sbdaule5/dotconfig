#!/bin/sh

WIFI_NAME=$(nmcli -g IN-USE,SSID device wifi | awk -F ':' '{if($1=="*")print $2}')
WIFI_STRENGTH=$(nmcli -g IN-USE,SIGNAL device wifi | awk -F ':' '{if($1=="*")print $2}')

WIFI_HIGH="󰤨"
WIFI_MID_HIGH="󰤥 "
WIFI_MID_LOW="󰤢"
WIFI_LOW="󰤟"

if [ -n "$WIFI_NAME" ]
then
    if [ "$WIFI_STRENGTH" -gt 75 ]
    then
        ICON="$WIFI_HIGH"
    elif [ "$WIFI_STRENGTH" -gt 50 ]
    then
        ICON="$WIFI_MID_HIGH"
    elif [ "$WIFI_STRENGTH" -gt 25 ]
    then
        ICON="$WIFI_MID_LOW"
    else
        ICON="$WIFI_LOW"
    fi
    # echo -e "<span color='#282828' bgcolor='#458588' bgalpha='90%'> <b>$ICON $WIFI_NAME $WIFI_STRENGTH%</b> </span>"
    echo -e "$ICON $WIFI_NAME $WIFI_STRENGTH% |"
fi

