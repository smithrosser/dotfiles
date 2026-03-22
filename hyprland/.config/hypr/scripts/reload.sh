#!/usr/bin/env bash

# Reloads hyprland
hyprctl reload

# Reload waybar
killall waybar
hyprctl dispatch exec waybar

# Reload mako
killall mako
hyprctl dispatch exec mako
