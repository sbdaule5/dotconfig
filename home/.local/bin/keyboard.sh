#/usr/bin/env sh
killall xcape

if [ -z "$1" ] || [ "$1" == "60" ]; then
  setxkbmap -option ctrl:nocaps
  setxkbmap -option shift:both_capslock
  xmodmap -e 'keycode 9 = grave asciitilde grave asciitilde' -e 'keycode 49 = Escape NoSymbol Escape' -e "keycode  65 = Super_L space Super_L space" -e "keycode 135 = space"
  notify-send "60% keyboard layout activated" -a "Keyboard.sh"
elif [ "$1" == "100" ]; then
  setxkbmap -option ctrl:nocaps
  setxkbmap -option shift:both_capslock
  xmodmap -e 'keycode 49 = grave asciitilde grave asciitilde' -e 'keycode 9 = Escape NoSymbol Escape' -e "keycode  65 = Super_L space Super_L space" -e "keycode 135 = space"
  notify-send "100% keyboard layout activated" -a "Keyboard.sh"
elif [ "$1" == "0" ] || [ "${1,,}" == "std" ]; then
  setxkbmap -option
  notify-send "Standard keyboard layout restored" -a "Keyboard.sh"
else
  echo "Invalid keyboard layout. Valid options are '100' and '60'(default)"
fi

xcape -e 'Super_L=space' -t 300
xcape -e 'Control_L=Escape' -t 300

