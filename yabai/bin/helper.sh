#!/bin/zsh

export PATH="/opt/homebrew/bin:$PATH"

function query {
	echo $(yabai -m query --spaces --display | $jq "$1")
}

function create_space {
	local idx=$(yabai -m query --spaces --display | jq 'map(select(."is-native-fullscreen" == false))[-1].index')
	yabai -m space --create && yabai -m space --focus $(($idx + 1))
}

function destroy_current_space {
	yabai -m space --destroy
}

function focus_window {
	disable_full_screen
	ensure_focus_window
	(yabai -m window --focus $1 || yabai -m display --focus $1)
}

function focus_space {
	yabai -m space --focus $1
}

function move_window {
	yabai -m window --space $1
	sketchybar --trigger windows_on_spaces
}

function swap_window {
	yabai -m window --swap $1
}

function swap_space {
	yabai -m space --swap $1
	sketchybar --trigger windows_on_spaces
}

function zoom_window {
	case $1 in
	full) yabai -m window --toggle zoom-fullscreen ;;
	parent) yabai -m window --toggle zoom-parent ;;
	esac
}

function balance_window {
	disable_full_screen
	disable_float
	yabai -m space --balance
}

function resize_window {
	case $1 in
	top) yabai -m window --resize top:0:-40 ;;
	left) yabai -m window --resize left:-40:0 ;;
	bottom) yabai -m window --resize bottom:0:40 ;;
	right) yabai -m window --resize right:40:0 ;;
	esac
}

function rotate_window {
	yabai -m space --rotate $1
}

function centrize_window {
	yabai -m window --toggle float --grid 1:10:2:0:6:1
}

function ensure_focus_window {
	focus=$(yabai -m query --windows --space | jq '.[] | select(.["has-focus"] == true) | .id')
	if [ -z "$focus" ]; then
		yabai -m window --focus first
	fi
}

function disable_full_screen {
	yabai -m query --windows --space |
		jq '.[] | select(.["has-fullscreen-zoom"] == true) | .id' |
		xargs -I@ yabai -m window @ --toggle zoom-fullscreen
}

function disable_float {
	yabai -m query --windows --space |
		jq '.[] | select(.["is-floating"] == true) | .id' |
		xargs -I@ yabai -m window @ --toggle float

}

function main {
	arg=${@:2:2}

	case ${@:1:1} in
	create_space) create_space ;;
	destroy_current_space) destroy_current_space ;;
	focus_space) focus_space $arg ;;
	move_space) move_space $arg ;;
	swap_space) swap_space $arg ;;

	focus_window) focus_window $arg ;;
	move_window) move_window $arg ;;
	swap_window) swap_window $arg ;;
	balance_window) balance_window ;;
	resize_window) resize_window $arg ;;
	rotate_window) rotate_window $arg ;;
	centrize_window) centrize_window ;;
	zoom_window) zoom_window $arg ;;
	esac
}

main "$@"
