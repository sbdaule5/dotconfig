{
        "layer": "top", // Waybar at top layer
        "position": "top", // Waybar position (top|bottom|left|right)
        // "height": 30, // Waybar height (to be removed for auto height)
        // "width": 1280, // Waybar width
        // "spacing": 4, // Gaps between modules (4px)
        // Choose the order of the modules
        "output": "@|output|",
        "modules-left": [
            "hyprland/workspaces",
            "custom/num_windows",
            // "sway/mode",
            // "sway/scratchpad",
            "hyprland/window"
        ],
        // "modules-center": [
        // ],
        "modules-right": [
            "mpd",
            "custom/mpd-lang",
            "mpris",
            "pulseaudio",
            "network",
            // "cpu",
            // "memory",
            // "temperature",
            "backlight",
            "keyboard-state",
            // "hyprland/language",
            "clock",
            "custom/notification",
            "idle_inhibitor",
            "power-profiles-daemon",
            "battery",
            "tray"
        ],
// Modules configuration
@(include "modules/mpd.scrbl")
@(include "modules/mpd-lang.scrbl")
@(include "modules/hyprland/workspaces.scrbl")
@(include "modules/hyprland/window.scrbl")
@(include "modules/keyboard-state.scrbl")
@(include "modules/mpris.scrbl")
@(include "modules/idle_inhibitor.scrbl")
@(include "modules/tray.scrbl")
@(include "modules/clock.scrbl")
@(include "modules/cpu.scrbl")
@(include "modules/memory.scrbl")
@(include "modules/temperature.scrbl")
@(include "modules/backlight.scrbl")
@(include "modules/battery.scrbl")
@(include "modules/power-profiles.scrbl")
@(include "modules/network.scrbl")
@(include "modules/pulseaudio.scrbl")
@(include "modules/custom/num-windows.scrbl")
}
