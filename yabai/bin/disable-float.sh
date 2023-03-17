#!/usr/bin/env sh

# Retrieve full-screened window in current space.
yabai -m query --windows --space |
    jq '.[] | select(.["is-floating"] == true) | .id' |
    xargs -I@ yabai -m window @ --toggle float

