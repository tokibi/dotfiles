#!/bin/bash

set -e

DOTFILES_ROOT=$(git rev-parse --show-toplevel)
. "$DOTFILES_ROOT/misc/misc.sh"

info "setup $NAME"

mkdir -p "$XDG_CONFIG_HOME/sketchybar"
link_file "$SCRIPT_DIR/sketchybarrc" "$XDG_CONFIG_HOME/sketchybar/sketchybarrc"
link_file "$SCRIPT_DIR/colors.sh" "$XDG_CONFIG_HOME/sketchybar/colors.sh"
link_file "$SCRIPT_DIR/icons.sh" "$XDG_CONFIG_HOME/sketchybar/icons.sh"
link_file "$SCRIPT_DIR/plugins" "$XDG_CONFIG_HOME/sketchybar/plugins"

success "$NAME"
