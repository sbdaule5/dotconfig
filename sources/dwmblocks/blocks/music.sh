#!/bin/sh

PLAYER=$(playerctl -l | head -n 1)


# Doing acitons when buttons are pressed
if [ -n "$1" ]; then
    if [ "$1" -eq 1 ]; then
        playerctl play-pause
    elif [ "$1" -eq 2 ]; then
        NEW_PLAYER=$(playerctl -l | dmenu)
        while [ "$PLAYER" -neq "$NEW_PLAYER" ]; do
            playerctld shift
            PLAYER=$(playerctl -l | head -n 1)
        done
    elif [ "$1" -eq 3 ]
    then
        playerctld shift
    elif [ "$1" -eq 4 ]
    then
        playerctl position 10-
    elif [ "$1" -eq 5 ]
    then
        playerctl position 10+
    fi
fi

TITLE=$(playerctl metadata title)
ARTIST=$(playerctl metadata artist)
STATUS=$(playerctl status)
COLOR=""

if [ "${#TITLE}" -gt 20 ]; then
    TITLE="${TITLE:0:20}..."
fi

PLAYER=$(echo "$PLAYER" | sed 's/\([^.]*\).*/\1/')

if [ "$STATUS" == "Playing" ]; then
    if [ "$PLAYER" == "mpd" ]; then
        NAME=$(mpc status -f "[[%title%] - [%artist%]]"| awk '{if (NR==1) head=$0; if(NR==2){if($1 == "[playing]"){print head " " $3}}}')
        TIME=$(mpc status -f "[%title%]"| awk '{if (NR==1) head=$0; if(NR==2){if($1 == "[playing]"){print $3}}}')

        echo -e "$COLOR  $TITLE $TIME ($PLAYER)|"
    else
        if [ -n "$ARTIST" ]; then
            echo -e "$COLOR  $TITLE ($PLAYER)|"
        else
            echo -e "$COLOR  $TITLE ($PLAYER)|"
        fi
    fi
else
    echo -e "$COLOR   ($PLAYER)|"
fi

