#!/usr/bin/env bash

FRONT_APP_SCRIPT='sketchybar --set "$NAME" label="$INFO"'

yabai=(
	script="$PLUGIN_DIR/front-app/scripts/yabai.sh"
	label.drawing=off
	icon.drawing=off
	icon.font="$FONT:Bold:16.0"
	icon.width=30
	icon="$YABAI_GRID"
	icon.color="$PEACH"
	associated_display=active
)

front_app=(
	script="$FRONT_APP_SCRIPT"
	icon.drawing=off
	background.padding_left=0
	label.color="$LABEL_COLOR"
	label.font="$FONT:Bold:16.0"
	associated_display=active
)

sketchybar --add event window_focus            \
           --add event windows_on_spaces       \
           --add item yabai left               \
           --set yabai "${yabai[@]}"           \
           --subscribe yabai window_focus      \
                             windows_on_spaces \
                             mouse.clicked     \
                                               \
           --add item front_app left           \
           --set front_app "${front_app[@]}"   \
           --subscribe front_app front_app_switched
