#!/bin/bash

set -e

DOTFILES_ROOT=$(git rev-parse --show-toplevel)
. "$DOTFILES_ROOT/misc/misc.sh"

info "setup $NAME"

link_file "$SCRIPT_DIR/config.yml" "$XDG_CONFIG_HOME/lazygit/config.yml"

success "$NAME"

