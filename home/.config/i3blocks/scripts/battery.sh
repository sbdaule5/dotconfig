#!/bin/sh

ACPI_OUT=$(acpi -bi)

STATUS=$(echo $ACPI_OUT | awk -F ' ' 'NR==1 {print $3}' | sed 's/,//')

BATTERY_CURR_PERC=$(echo "$ACPI_OUT" | awk -F ' ' 'NR==1{print $4}' | sed -e 's/[%|,]//g')
BATTERY_CURR_FRAG=$(echo "$BATTERY_CURR_PERC / 10" | bc)
BATTERY_MAX_PERC=$(echo "$ACPI_OUT" | awk -F ' ' 'NR==2{print $NF}' | sed -e 's/%//g')
BATTERY_100=$(echo "$BATTERY_MAX_PERC * $BATTERY_CURR_PERC" | bc -l)
BATTERY=$(echo "scale=2; $BATTERY_100/100.0" | bc -l)

DISCHARGING="󰁺󰁻󰁼󰁽󰁾󰁿󰂀󰂁󰂂󰁹"
CHARGING="󰂆󰂇󰂈󰢝󰢝󰂉󰢞󰂊󰂋󰂅"

case "$STATUS" in
    Full)
        ICON=󰁹
        echo -e "<span color='#0a0515' bgcolor='#27e74a' bgalpha='90%'> <b>$ICON $BATTERY%</b> </span>"
        ;;
    Charging)
        ICON=${CHARGING:$BATTERY_CURR_FRAG:1}
        echo -e "<span color='#0a0515' bgcolor='#E7A927' bgalpha='90%'> <b>$ICON $BATTERY%</b> </span>"
        ;;
    Discharging)
        ICON=${DISCHARGING:$BATTERY_CURR_FRAG:1}
        echo -e "<span color='#0a0515' bgcolor='#E72727' bgalpha='90%'> <b>$ICON $BATTERY%</b> </span>"
        ;;
    *)
        ICON=󱃌
        echo -e "<span color='#0a0515' bgcolor='#E72727' bgalpha='90%'> <b>$ICON $BATTERY%</b> </span>"
        ;;
esac
