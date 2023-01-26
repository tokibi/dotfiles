#!/bin/bash

set -e

DOTFILES_ROOT=$(git rev-parse --show-toplevel)
. "$DOTFILES_ROOT/misc/misc.sh"

info "setup $NAME"

mkdir -p $XDG_CONFIG_HOME/karabiner
link_file "$SCRIPT_DIR/karabiner.json" "$XDG_CONFIG_HOME/karabiner/karabiner.json"

success "$NAME"
