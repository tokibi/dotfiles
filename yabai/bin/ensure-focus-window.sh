#!/usr/bin/env sh

focus=$(yabai -m query --windows --space | jq '.[] | select(.["has-focus"] == true) | .id')
if [ -z "$focus" ]; then
    yabai -m window --focus first
fi
