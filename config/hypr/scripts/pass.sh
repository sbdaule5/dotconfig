wofi-pass || exit 0;
passwd="$(wl-paste)";
cliphist delete-query "$passwd";
sleep 45;
if [[ $(wl-paste) == "$passwd" ]]; then
    wl-copy "Password cleared";
fi
notify-send "Password cleared"
