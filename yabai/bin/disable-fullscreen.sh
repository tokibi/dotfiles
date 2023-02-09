#!/usr/bin/env sh

# Retrieve full-screened window in current space.
window_id=$(yabai -m query --windows --space | jq '.[] | select(.["has-fullscreen-zoom"] == true) | .id')

if [ -n "$window_id" ]; then
    yabai -m window $window_id --toggle zoom-fullscreen
fi
