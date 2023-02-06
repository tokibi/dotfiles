#!/usr/bin/env sh

active_space=$(yabai -m query --spaces --space | jq .index)
fullscreened_window_id=$(yabai -m query --windows --display | jq '.[] | select(.space == '$active_space' and .["has-fullscreen-zoom"] == true) | .id')

if [ -n "$fullscreened_window_id" ]; then
    yabai -m window --toggle zoom-fullscreen
fi
