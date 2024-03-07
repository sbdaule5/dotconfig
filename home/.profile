
export PATH=~/.local/bin:~/.local/share/npm/bin:~/.local/share/pnpm:$PATH
export EDITOR=nvim
export VISUAL="~/.local/bin/nve"
export TERMINAL="alacritty"
export TERMINAL_PROG="alacritty"
export BROWSER=qutebrowser

# Home directory clean-up:
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"
export NO_XDG_HOME="/home/sbdaule/.local/share/no-xdg-home/"
export XINITRC="$XDG_CONFIG_HOME/x11/xinitrc"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
export GTK_THEME=Adwaita:dark
export INPUTRC="$XDG_CONFIG_HOME/shell/inputrc"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME/android"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GOPATH="$XDG_DATA_HOME/go"
export PATH="$GOPATH/bin:$PATH"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
export HISTFILE="$XDG_STATE_HOME/history"
export MBSYNCRC="$XDG_CONFIG_HOME/mbsync/config"
export ELECTRUMDIR="$XDG_DATA_HOME/electrum"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc"
export PYTHONPYCACHEPREFIX=$XDG_CACHE_HOME/python
export PYTHONUSERBASE=$XDG_DATA_HOME/python
export SQLITE_HISTORY="$XDG_STATE_HOME/sqlite_history"
export GRB_LICENSE_FILE="$XDG_DATA_HOME/gurobi.lic"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export KODI_DATA="$XDG_DATA_HOME/kodi"
export MAILCAPS="$XDG_CONFIG_HOME/mailcap:/usr/share/neomutt/mailcap"
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export PNPM_HOME=$XDG_DATA_HOME/pnpm
export GEM_HOME="$(gem env user_gemhome)"
export PATH="$PATH:$GEM_HOME/bin"
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME/notmuch-config"
export PUB_CACHE=$XDG_CACHE_HOME/pub
export TERMINFO=$XDG_DATA_HOME/terminfo
export TERMINFO_DIRS=$XDG_DATA_HOME/terminfo:/usr/share/terminfo:$TERMINFO_DIRS
export W3M_DIR="$XDG_STATE_HOME/w3m"
export DOT_SAGE="$XDG_CONFIG_HOME"/sage
export RANDFILE="$XDG_STATE_HOME"/rnd
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
# export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority" # This line will break some DMs.
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
export FZF_DEFAULT_COMMAND='bfs . -type d \( -name .cache -o -name caches -o -name Cache -o -path ./.npm -o -path ./.cargo -o -name node_modules -o -name .git -o -name venv -o -name venvs -o -name pyvenv -o -name pnpm -o -name "BraveSoftware" -o -path ./.local/share/flutter -o -name Steam -o -path ./.local/share/Trash -o -path ./Files -o -name wineprefixes \) -prune -o -iname "*"'
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

function startserv(){
  sessions=( 'dwm' 'sddm' )
  select session in "${sessions[@]}"; do
    if [ "$session" = 'dwm' ]; then
      exec startx "$XINITRC"
    else
      systemctl start sddm
    fi
    break
  done
}

# Start graphical server on user's current tty if not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pidof -s Xorg >/dev/null 2>&1 && startserv

# Switch escape and caps if tty and no passwd required:
# sudo -n loadkeys ${XDG_DATA_HOME:-$HOME/.local/share}/myconfigs/ttymaps.kmap 2>/dev/null
