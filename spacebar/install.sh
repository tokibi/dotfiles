#!/bin/bash

set -e

DOTFILES_ROOT=$(git rev-parse --show-toplevel)
. "$DOTFILES_ROOT/misc/misc.sh"

info "setup $NAME"

mkdir -p "$XDG_CONFIG_HOME/spacebar"
link_file "$SCRIPT_DIR/spacebarrc" "$XDG_CONFIG_HOME/spacebar/spacebarrc"

success "$NAME"

