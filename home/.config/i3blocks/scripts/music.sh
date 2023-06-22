#!/bin/sh

PLAYER=$(playerctl -l | head -n 1)


# Doing acitons when buttons are pressed
if [ -n "$button" ]; then
    if [ "$button" -eq 1 ]; then
        playerctl play-pause
    elif [ "$button" -eq 2 ]; then
        NEW_PLAYER=$(playerctl -l | dmenu)
        while [ "$PLAYER" -neq "$NEW_PLAYER" ]; do
            playerctld shift
            PLAYER=$(playerctl -l | head -n 1)
        done
    elif [ "$button" -eq 3 ]
    then
        playerctld shift
    elif [ "$button" -eq 4 ]
    then
        playerctl position 10-
    elif [ "$button" -eq 5 ]
    then
        playerctl position 10+
    fi
fi

TITLE=$(playerctl metadata title | sed 's/&/&amp;/g')
ARTIST=$(playerctl metadata artist | sed 's/&/&amp;/g')
STATUS=$(playerctl status | sed 's/&/&amp;/g')

if [ "$STATUS" == "Playing" ]; then
    if [ "$PLAYER" == "mpd" ]; then
        NAME=$(mpc status -f "[[%title%] - [%artist%]]"| awk '{if (NR==1) head=$0; if(NR==2){if($1 == "[playing]"){print head " " $3}}}' | sed -e 's/&/&amp;/g')
        NAME_SHORT=$(mpc status -f "[%title%]"| awk '{if (NR==1) head=$0; if(NR==2){if($1 == "[playing]"){print head " " $3}}}' | sed -e 's/&/&amp;/g')
        echo -e "<span color='#282828' bgcolor='#b16286' bgalpha='90%'> <b> $NAME</b> <span size=\"x-small\">($PLAYER)</span></span>"
        echo -e "<span color='#282828' bgcolor='#b16286' bgalpha='90%'> <b> $NAME_SHORT</b> <span size=\"x-small\">($PLAYER)</span></span>"
    else
        if [ -n "$ARTIST" ]; then
            echo -e "<span color='#282828' bgcolor='#b16286' bgalpha='90%'> <b> $TITLE - $ARTIST</b> <span size=\"x-small\">($PLAYER)</span></span>"
        fi
        echo -e "<span color='#282828' bgcolor='#b16286' bgalpha='90%'> <b> $TITLE</b> <span size=\"x-small\">($PLAYER)</span></span>"
    fi
else
    echo -e "<span color='#282828' bgcolor='#b16286' bgalpha='90%'>   <span size=\"x-small\">($PLAYER)</span></span>"
fi

