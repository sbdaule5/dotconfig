
export PATH=~/.local/bin:$PATH
export EDITOR=nvim
export VISUAL="~/.local/bin/nve"
export TERMINAL="alacritty"
export TERMINAL_PROG="alacritty"
export BROWSER=qutebrowser

# Home directory clean-up:
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XINITRC="$XDG_CONFIG_HOME/x11/xinitrc"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
export INPUTRC="$XDG_CONFIG_HOME/shell/inputrc"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME/android"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GOPATH="$XDG_DATA_HOME/go"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
export HISTFILE="$XDG_DATA_HOME/history"
export MBSYNCRC="$XDG_CONFIG_HOME/mbsync/config"
export ELECTRUMDIR="$XDG_DATA_HOME/electrum"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc"
export SQLITE_HISTORY="$XDG_DATA_HOME/sqlite_history"
export GRB_LICENSE_FILE="$XDG_DATA_HOME/gurobi.lic"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export KODI_DATA="$XDG_DATA_HOME/kodi"
export MAILCAPS="$XDG_CONFIG_HOME/mailcap:/usr/share/neomutt/mailcap"
# export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
# export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority" # This line will break some DMs.
# export NOTMUCH_CONFIG="$XDG_CONFIG_HOME/notmuch-config"
# export ANSIBLE_CONFIG="$XDG_CONFIG_HOME/ansible/ansible.cfg"
# export UNISON="$XDG_DATA_HOME/unison"

# Other program settings:
export SUDO_ASKPASS="$HOME/.local/bin/dmenupass"
export QT_QPA_PLATFORMTHEME="gtk2" # Have QT use gtk2 theme.
export MOZ_USE_XINPUT2="1" # Mozilla smooth scrolling/touchpads.
export AWT_TOOLKIT="MToolkit wmname LG3D" # May have to install wmname
export _JAVA_AWT_WM_NONREPARENTING=1 # Fix for Java applications in dwm
# export DICS="/usr/share/stardict/dic/"
# export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
export FZF_DEFAULT_COMMAND='bfs . -type d \( -name .cache -o -name caches -o -name Cache -o -path ./.npm -o -path ./.cargo -o -name node_modules -o -name .git -o -name venv -o -name venvs -o -name pyvenv -o -name lib -o -name pnpm -o -name "BraveSoftware" -o -path ./.local/share/flutter -o -name Steam -o -path ./.local/share/Trash -o -path ./Files \) -prune -o -iname "*"'
# export LESS=-R
# export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"
# export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"
# export LESS_TERMCAP_me="$(printf '%b' '[0m')"
# export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"
# export LESS_TERMCAP_se="$(printf '%b' '[0m')"
# export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"
# export LESS_TERMCAP_ue="$(printf '%b' '[0m')"
# export LESSOPEN="| /usr/bin/highlight -O ansi %s 2>/dev/null"

# [ ! -f ${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc ] && setsid shortcuts >/dev/null 2>&1

# Start graphical server on user's current tty if not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pidof -s Xorg >/dev/null 2>&1 && exec startx "$XINITRC"

# Switch escape and caps if tty and no passwd required:
sudo -n loadkeys ${XDG_DATA_HOME:-$HOME/.local/share}/myconfigs/ttymaps.kmap 2>/dev/null
