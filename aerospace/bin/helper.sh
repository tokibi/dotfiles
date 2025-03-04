#!/bin/zsh

export PATH="/opt/homebrew/bin:$PATH"

function create_space {
}

function destroy_current_space {
}

function focus_window {
	disable_full_screen
	ensure_focus_window

	case $1 in
	west) aerospace focus left ;;
	east) aerospace focus right ;;
	north) aerospace focus up ;;
	south) aerospace focus down ;;
	esac
}

function focus_space {
	aerospace workspace $1
}

function move_window {
	aerospace move-node-to-workspace $1
}

function swap_window {
	case $1 in
	west) aerospace move left ;;
	east) aerospace move right ;;
	north) aerospace move up ;;
	south) aerospace move down ;;
	esac
}

function swap_space {
	# yabai -m space --swap $1
	# sketchybar --trigger windows_on_spaces
}

function zoom_window {
	case $1 in
	full) aerospace fullscreen ;;
	parent) yabai -m window --toggle zoom-parent ;;
	esac
}

function balance_window {
	disable_full_screen
	# disable_float
	aerospace balance-sizes
}

function resize_window {
	case $1 in
	top) aerospace resize height -80 ;;
	left) aerospace resize width -80 ;;
	bottom) aerospace resize height +80 ;;
	right) aerospace resize width +80 ;;
	plus) aerospace resize smart +80 ;;
	minus) aerospace resize smart -80 ;;
	esac
}

function rotate_window {
	# yabai -m space --rotate $1
}

function centrize_window {
	aerospace layout tiles accordion
}

function ensure_focus_window {
	focused=$(aerospace list-windows --focused | wc -l)
	if [ $focused -eq 0 ]; then
		aerospace focus --dfs-index 0
	fi
}

function disable_full_screen {
	aerospace fullscreen off 2> /dev/null
}

function disable_float {
	# yabai -m query --windows --space |
	# 	jq '.[] | select(.["is-floating"] == true) | .id' |
	# 	xargs -I@ yabai -m window @ --toggle float

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
