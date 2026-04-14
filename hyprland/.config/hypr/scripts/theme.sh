#!/usr/bin/env bash

LIGHT_THEME='Adwaita'
DARK_THEME='Adwaita-dark'

CURRENT_THEME=$(gsettings get org.gnome.desktop.interface gtk-theme | tr -d "'")

toggle_theme() {
    if [ "$CURRENT_THEME" = "$DARK_THEME" ]; then
        # SWITCH TO LIGHT
        gsettings set org.gnome.desktop.interface gtk-theme "$LIGHT_THEME"
        gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
    else
        # SWITCH TO DARK
        gsettings set org.gnome.desktop.interface gtk-theme "$DARK_THEME"
        gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
    fi
}

get_theme() {
    if [ "$CURRENT_THEME" == "'prefer-dark'" ]; then
        echo '{"text": " ", "class": "dark"}'
    else
        echo '{"text": " ", "class": "light"}'
    fi
    pkill -RTMIN+1 waybar
}

case "$1" in
    "get")
        get_theme
        ;;
    *)
        toggle_theme
        ;;
esac

