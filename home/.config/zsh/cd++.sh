#!/usr/bin/env zsh

STORE_FILE="${XDG_STATE_HOME:-~/.local/state}"/dirs

# goto: Change the current working directory to the path associated with the given label
function goto {
    if [ -z "$1" ]; then
        echo "Usage: goto <label>"
        return 1
    fi

    #echo "Checking if $STORE_FILE exist..."
    if [ ! -f "$STORE_FILE" ]
    then
        echo "Does not exist  - creating"
        touch "$STORE_FILE"
    fi

    local dir=$(grep "^$1 " $STORE_FILE | cut -d' ' -f2-)
    if [ -z "$dir" ]; then
        echo "Error: Label not found."
        return 1
    fi
    # echo "Changing dir to $dir"
    cd "$dir" || { echo "Error: Failed to change directory"; return 1; }
    # echo "Change dir OK"
}


# mark: Add a label for the current working directory or update an existing label
function mark {
    if [ -z "$1" ]; then
        echo "Usage: mark <label>"
        return 1
    fi

    local label_exists=$(grep "^$1 " $STORE_FILE)
    local current_path=$(pwd)
    
    if [ -z "$label_exists" ]; then
        echo "$1 $current_path" >> $STORE_FILE
    else
        local dir=$(echo "$label_exists" | cut -d' ' -f2-)
        if [[ "$dir" == "$current_path" ]]; then
            echo "Link named $1 already registered for this path"
            return 1
        else
            echo "$1 $current_path" >> $STORE_FILE
        fi
    fi
}


# list_dirs: List all labels and their associated directory paths
function list_dirs {
    local dirs=$(cat $STORE_FILE)
    local output=$(echo "${dirs}" | awk '{printf("%-30s", $1); printf("%-30s", $2); printf("%-30s", $3); printf("%-30s\n", $4);}' | sort)
    echo "${output}"
}


alias list_labels=list_dirs
