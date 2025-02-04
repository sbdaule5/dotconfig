#!/bin/sh

ACPI_OUT=$(acpi -bi)

STATUS=$(acpi -bi | head -n1 | sed 's/.*: \([^,]*\),.*/\1/')

BATTERY_CURR_PERC=$(echo "$ACPI_OUT" | head -n1 | cut -d',' -f2 | sed -e 's/[%|,]//g')
BATTERY_CURR_FRAG=$(echo "($BATTERY_CURR_PERC / 10) - 1" | bc)
BATTERY_MAX_PERC=$(echo "$ACPI_OUT" | awk -F ' ' 'NR==2{print $NF}' | sed -e 's/%//g')
BATTERY_100=$(echo "$BATTERY_MAX_PERC * $BATTERY_CURR_PERC" | bc -l)
BATTERY=$(echo "scale=0; $BATTERY_100/100.0" | bc -l)

DISCHARGING="󰁺󰁻󰁼󰁽󰁾󰁿󰂀󰂁󰂂󰁹"
CHARGING="󰂆󰂇󰂈󰢝󰢝󰂉󰢞󰂊󰂋󰂅"

case "$STATUS" in
    Full|"Not charging")
        ICON=󰁹
        # echo -e "<span color='#282828' bgcolor='#98971a' bgalpha='90%'> <b>$ICON $BATTERY%</b> </span>"
        printf "$ICON $BATTERY%% "
        ;;
    Charging)
        ICON=${CHARGING:$BATTERY_CURR_FRAG:1}
        # echo -e "<span color='#282828' bgcolor='#E7A927' bgalpha='90%'> <b>$ICON $BATTERY%</b> </span>"
        printf " $ICON $BATTERY%% "
        ;;
    Discharging)
        ICON=${DISCHARGING:$BATTERY_CURR_FRAG:1}
        # ICON=$BATTERY_CURR_FRAG
        # echo -e "<span color='#282828' bgcolor='#E72727' bgalpha='90%'> <b>$ICON $BATTERY%</b> </span>"
        if [ "$BATTERY" -lt 20 ]; then
            printf " $ICON $BATTERY%% "
        elif [ "$BATTERY" -lt 50 ]; then
            printf " $ICON $BATTERY%% "
        else
            printf "$ICON $BATTERY%% "
        fi
        ;;
    *)
        ICON=󱃌
        # echo -e "<span color='#282828' bgcolor='#E72727' bgalpha='90%'> <b>$ICON $BATTERY%</b> </span>"
        printf " $ICON $BATTERY%% "
        ;;
esac
