#!/bin/bash

set -e

DOTFILES_ROOT=$(git rev-parse --show-toplevel)
. "$DOTFILES_ROOT/misc/misc.sh"

info "setup $NAME"

mkdir -p $XDG_CONFIG_HOME/aerospace
link_file "$SCRIPT_DIR/aerospace.toml" "$XDG_CONFIG_HOME/aerospace/aerospace.toml"
link_file "$SCRIPT_DIR/bin" "$XDG_CONFIG_HOME/aerospace/bin"

success "$NAME"
