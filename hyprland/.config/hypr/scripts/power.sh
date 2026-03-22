#!/usr/bin/env bash
OPT_LOGOUT="   Log out"
OPT_SUSPEND="   Suspend"
OPT_REBOOT="   Reboot"
OPT_SHUTDOWN="   Shut down"

# Options
declare -a options=(
    "$OPT_LOGOUT"
    "$OPT_SUSPEND"
    "$OPT_REBOOT"
    "$OPT_SHUTDOWN"
)

# Pipe into walker
choice=$(printf '%s\n' "${options[@]}" | walker --dmenu)

# Execute choice
case "$choice" in
    "$OPT_LOGOUT")
        hyprctl dispatch exit
        ;;
    "$OPT_SUSPEND")
        systemctl suspend
        ;;
    "$OPT_REBOOT")
        systemctl reboot
        ;;
    "$OPT_SHUTDOWN")
        systemctl poweroff
        ;;
esac
