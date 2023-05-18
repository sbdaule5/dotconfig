#!/bin/sh

MEM_USED=$(free | awk 'NR==2{print $3}')
MEM_TOTAL=$(free | awk 'NR==2{print $2}')
MEM_PERC="$(printf "scale=2; $MEM_USED * 100 / $MEM_TOTAL\n" | bc -l)"
echo -e "<span color='#0a0515' bgcolor='#27e74a' bgalpha='90%'> <b>󰍛 $MEM_PERC%</b> </span>"
