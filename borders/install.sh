#!/bin/bash

set -e

DOTFILES_ROOT=$(git rev-parse --show-toplevel)
. "$DOTFILES_ROOT/misc/misc.sh"

info "setup $NAME"

which borders &>/dev/null || brew install FelixKratz/formulae/borders

mkdir -p $XDG_CONFIG_HOME/borders
link_file "$SCRIPT_DIR/bordersrc" "$XDG_CONFIG_HOME/borders/bordersrc"

brew services restart borders

success "$NAME"
