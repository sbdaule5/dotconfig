#!/usr/bin/bash

source "$XDG_CONFIG_HOME/shell/keys"

op="$1"
KEY_ID="$PASS_GPG_KEY"

if [ -z "$op" ]; then
    echo "Please specify operation" >&2
    exit 255
fi

if [ -z "$KEY_ID" ]; then
    echo "Key Id not found, exiting" >&2
    exit 255
fi

unlock() {
    file=$(mktemp -t temporary-file.XXXXXX)
    echo "1234" > "${file}"
    gpg -r "$KEY_ID" -e "${file}"
    gpg -d "${file}.gpg"
    rm "${file}" "${file}.gpg"
}

lock() {
    gpgconf --kill gpg-agent
    gpgconf --launch gpg-agent
}

case "$op" in
    lock)
        lock
        ;;
    unlock)
        unlock
        ;;
    *)
        exit 255
        ;;
esac
