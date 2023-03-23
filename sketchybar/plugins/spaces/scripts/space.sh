#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"

update() {
	COLOR=$OVERLAY1
	if [ "$SELECTED" = "true" ]; then
		COLOR=$TEXT
	fi
	sketchybar --set $NAME icon.highlight=$SELECTED label.highlight="$SELECTED" background.border_color="$COLOR"
}

mouse_clicked() {
	if [ "$BUTTON" = "right" ]; then
		yabai -m space --destroy $SID
		sketchybar --trigger windows_on_spaces --trigger space_change
	else
		yabai -m space --focus $SID 2>/dev/null
	fi
}

case "$SENDER" in
"mouse.entered")
# 	mouse_entered
	;;
"mouse.exited")
# 	mouse_exited
	;;
"mouse.clicked")
	mouse_clicked
	;;
*)
	update
	;;
esac
