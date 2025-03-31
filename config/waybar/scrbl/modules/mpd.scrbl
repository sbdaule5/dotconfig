        "mpd": {
            "format": "{stateIcon} {consumeIcon}{randomIcon}{repeatIcon}{singleIcon}{title} ",
            "format-paused": "{stateIcon} ",
            "format-disconnected": "",
            "format-stopped": "",
            "interval": 10,
            "consume-icons": {
                "on": " " // Icon shows only when "consume" is on
            },
            "random-icons": {
                "off": "<span color=\"#f53c3c\"></span> ", // Icon grayed out when "random" is off
                "on": " "
            },
            "repeat-icons": {
                "on": " "
            },
            "single-icons": {
                "on": "1 "
            },
            "state-icons": {
                "paused": "",
                "playing": ""
            },
            "tooltip-format": "MPD (connected)",
            "tooltip-format-disconnected": "MPD (disconnected)",
            "on-click": "mpc toggle",
        },
