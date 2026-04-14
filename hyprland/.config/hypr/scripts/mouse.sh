#!/usr/bin/env bash

# Get the current state of the active window to determine toggle direction
STATE=$(hyprctl activewindow -j | jq -r '.nomouse')

if [ "$STATE" == "false" ]; then
    hyprctl clients -j | jq -r '.[].address' | xargs -I {} hyprctl dispatch setprop address:{} nomouse 1
else
    hyprctl clients -j | jq -r '.[].address' | xargs -I {} hyprctl dispatch setprop address:{} nomouse 0
fi
