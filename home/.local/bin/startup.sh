setsid -f xss-lock --transfer-sleep-lock -- i3lock --nofork -e -p default -i ~/.screen-saver.png
setsid -f nm-applet
setsid -f /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
setsid -f systemd-inhibit --what=handle-power-key --who="dwm-dmenushutdown" --why="Shutdown will be handled by dwm" sleep infinity
setsid -f conky -c .config/conky/conky1.conf -d
setsid -f picom --config ~/.config/picom/picom.config -b
setsid -f kdeconnect-indicator
setsid -f playerctld
setsid -f dunst
emacs --daemon
# clipmenud
# setsid -f mpd-mpris
