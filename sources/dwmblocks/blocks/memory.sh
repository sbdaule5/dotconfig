#!/bin/sh

MEM_USED=$(free | awk 'NR==2{print $3}')
MEM_TOTAL=$(free | awk 'NR==2{print $2}')
MEM_PERC="$(printf "scale=2; $MEM_USED * 100 / $MEM_TOTAL\n" | bc -l)"
# echo -e "<span color='#282828' bgcolor='#98971a' bgalpha='90%'> <b>󰍛 $MEM_PERC%</b> </span>"
echo -e "󰍛 $MEM_PERC% |"
