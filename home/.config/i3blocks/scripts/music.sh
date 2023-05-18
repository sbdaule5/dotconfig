#!/bin/sh

# NAME=$(mpc status -f "[[%artist%] - [%title%]]"| awk '{if (NR==1) head=$0; if(NR==2){if($1 == "[playing]"){print head " " $3}}}' | sed -e 's/\"/&quot;/g' -e 's/&/&amp;/g')

# NAME_SHORT=$(mpc status -f "[%title%]"| awk '{if (NR==1) head=$0; if(NR==2){if($1 == "[playing]"){print head " " $3}}}' | sed -e 's/\"/&quot;/g' -e 's/&/&amp;/g')

PLAYERS=$(playerctl -l)
PLAYING_PLAYER=""

for PLAYER in $PLAYERS
do
    if [ "$(playerctl -p "$PLAYER" status)" == "Playing" ]
    then
        PLAYING_PLAYERS="$PLAYING_PLAYERS $PLAYER"
    fi
done

if [ -z "$PLAYING_PLAYERS" ]
then
    PLAYING_PLAYER=$(playerctl -l | head -n $(echo $(date +%S) / 5 % $(playerctl -l | wc -l) + 1 | bc) | tail -n 1)
else
    PLAYING_PLAYER=$(echo $PLAYING_PLAYERS | cut -d' ' -f1- --output-delimiter=$'\n' | head -n $(echo $(date +%S) / 5 % \(${#PLAYING_PLAYERS[@]}  + 1\) +1 | bc) | tail -n 1)
fi

# Doing acitons when buttons are pressed
if [ -n "$button" ]; then
    if [ "$button" -eq 1 ]; then
        playerctl -p $PLAYING_PLAYER play-pause
    elif [ "$button" -eq 3 ]; then
        PLAYING_PLAYER=$(playerctl -l | dmenu)
    elif [ "$button" -eq 4 ]
    then
        playerctl -p $PLAYING_PLAYER position 10-
    elif [ "$button" -eq 5 ]
    then
        playerctl -p $PLAYING_PLAYER position 10+
    fi
fi

TITLE=$(playerctl -p $PLAYING_PLAYER metadata title | sed 's/&/&amp;/g')
ARTIST=$(playerctl -p $PLAYING_PLAYER metadata artist | sed 's/&/&amp;/g')
STATUS=$(playerctl -p $PLAYING_PLAYER status | sed 's/&/&amp;/g')

if [ "$STATUS" == "Playing" ]; then
    if [ "$PLAYING_PLAYER" == "mpd" ]; then
        NAME=$(mpc status -f "[[%title%] - [%artist%]]"| awk '{if (NR==1) head=$0; if(NR==2){if($1 == "[playing]"){print head " " $3}}}' | sed -e 's/&/&amp;/g')
        NAME_SHORT=$(mpc status -f "[%title%]"| awk '{if (NR==1) head=$0; if(NR==2){if($1 == "[playing]"){print head " " $3}}}' | sed -e 's/&/&amp;/g')
        echo -e "<span color='#0a0515' bgcolor='#EC5585' bgalpha='90%'> <b> $NAME</b> <span size=\"x-small\">($PLAYING_PLAYER)</span></span>"
        echo -e "<span color='#0a0515' bgcolor='#EC5585' bgalpha='90%'> <b> $NAME_SHORT</b> <span size=\"x-small\">($PLAYING_PLAYER)</span></span>"
    else
        if [ -n "$ARTIST" ]; then
            echo -e "<span color='#0a0515' bgcolor='#EC5585' bgalpha='90%'> <b> $TITLE - $ARTIST</b> <span size=\"x-small\">($PLAYING_PLAYER)</span></span>"
        fi
        echo -e "<span color='#0a0515' bgcolor='#EC5585' bgalpha='90%'> <b> $TITLE</b> <span size=\"x-small\">($PLAYING_PLAYER)</span></span>"
    fi
else
    echo -e "<span color='#0a0515' bgcolor='#EC5585' bgalpha='90%'>   <span size=\"x-small\">($PLAYING_PLAYER)</span></span>"
fi

