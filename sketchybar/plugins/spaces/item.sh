#!/bin/bash

# Destroy space on right click, focus space on left click.
# New space by left clicking separator (>)

source "$HOME/.config/sketchybar/colors.sh"

SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8" "9" "10")

space=(
	icon.padding_left=7
	icon.padding_right=7
	icon.color="$OVERLAY1"
	icon.highlight_color="$PEACH"
	icon.y_offset=1
	label.drawing=off
	label.padding_left=0
	label.padding_right=15
	label.color="$OVERLAY1"
	label.highlight_color="$TEXT"
	label.font="sketchybar-app-font:Regular:16.0"
	label.y_offset=-1
	background.padding_right=6
	background.height=24
	background.corner_radius=4
	background.border_width=0
	background.color="$CRUST"
	script="$PLUGIN_DIR/spaces/scripts/space.sh"
)

sid=0
for i in "${!SPACE_ICONS[@]}"
do
	sid=$(($i+1))

	sketchybar	--add	space space.$sid left \
				--set	space.$sid associated_space=$sid \
						icon="${SPACE_ICONS[i]}" \
						"${space[@]}" \
				--subscribe space.$sid mouse.clicked
done

spaces_bracket=(
	background.color="$BACKGROUND_1"
	background.border_color="$BACKGROUND_2"
	background.border_width=2
)

separator=(
	icon=
	icon.font="$NERD_FONT:Bold:16.0"
	icon.padding_left=6
	icon.padding_right=4
	label.drawing=off
	associated_display=active
	click_script='yabai -m space --create && sketchybar --trigger space_change'
)

sketchybar --add bracket spaces_bracket '/space\..*/'  \
           --set spaces_bracket "${spaces_bracket[@]}" \
                                                       \
           --add item separator left                   \
           --set separator "${separator[@]}"
