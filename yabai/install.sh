#!/bin/bash

set -e

DOTFILES_ROOT=$(git rev-parse --show-toplevel)
. "$DOTFILES_ROOT/misc/misc.sh"

info "setup $NAME"

mkdir -p $XDG_CONFIG_HOME/{yabai,skhd}
link_file "$SCRIPT_DIR/yabairc" "$XDG_CONFIG_HOME/yabai/yabairc"
link_file "$SCRIPT_DIR/bin" "$XDG_CONFIG_HOME/yabai/bin"

USER=$(whoami)
YABAI_PATH=$(which yabai)
YABAI_HASH=$(shasum -a 256 $YABAI_PATH | awk '{print $1}')

echo ""
info 'create a new file for writing - visudo uses the vim editor by default.'
info 'go read about this if you have no idea what is going on.'
user '  sudo visudo -f /private/etc/sudoers.d/yabai'
echo ""
info 'input the line below into the file you are editing.'
user "  $USER ALL=(root) NOPASSWD: sha256:$YABAI_HASH $YABAI_PATH --load-sa"
echo ""

success "$NAME"
