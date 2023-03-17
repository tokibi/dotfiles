#!/usr/bin/env sh

# Retrieve full-screened window in current space.
yabai -m query --windows --space |
    jq '.[] | select(.["has-fullscreen-zoom"] == true) | .id' |
    xargs -I@ yabai -m window @ --toggle zoom-fullscreen

