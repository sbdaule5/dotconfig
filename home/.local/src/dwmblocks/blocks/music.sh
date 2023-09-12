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

# TITLE=$(playerctl metadata title | sed 's/&/&amp;/g')
# ARTIST=$(playerctl metadata artist | sed 's/&/&amp;/g')
# STATUS=$(playerctl status | sed 's/&/&amp;/g')
TITLE=$(playerctl metadata title)
ARTIST=$(playerctl metadata artist)
STATUS=$(playerctl status)

PLAYER=$(echo "$PLAYER" | sed 's/\([^.]*\).*/\1/')

if [ "$STATUS" == "Playing" ]; then
    if [ "$PLAYER" == "mpd" ]; then
        NAME=$(mpc status -f "[[%title%] - [%artist%]]"| awk '{if (NR==1) head=$0; if(NR==2){if($1 == "[playing]"){print head " " $3}}}')
        NAME_SHORT=$(mpc status -f "[%title%]"| awk '{if (NR==1) head=$0; if(NR==2){if($1 == "[playing]"){print head " " $3}}}')
        # echo -e "<span color='#282828' bgcolor='#b16286' bgalpha='90%'> <b> $NAME</b> <span size=\"x-small\">($PLAYER)</span></span>"
        # echo -e "<span color='#282828' bgcolor='#b16286' bgalpha='90%'> <b> $NAME_SHORT</b> <span size=\"x-small\">($PLAYER)</span></span>"
        # echo -e "  $NAME ($PLAYER) "
        echo -e "  $NAME_SHORT ($PLAYER) "
    else
        if [ -n "$ARTIST" ]; then
            # echo -e "<span color='#282828' bgcolor='#b16286' bgalpha='90%'> <b> $TITLE - $ARTIST</b> <span size=\"x-small\">($PLAYER)</span></span>"
            # echo -e "  $TITLE - $ARTIST ($PLAYER)"
            echo -e "  $TITLE ($PLAYER)"
        else
            # echo -e "<span color='#282828' bgcolor='#b16286' bgalpha='90%'> <b> $TITLE</b> <span size=\"x-small\">($PLAYER)</span></span>"
            echo -e "  $TITLE ($PLAYER)"
        fi
    fi
else
    # echo -e "<span color='#282828' bgcolor='#b16286' bgalpha='90%'>   <span size=\"x-small\">($PLAYER)</span></span>"
    echo -e "   ($PLAYER)"
fi

