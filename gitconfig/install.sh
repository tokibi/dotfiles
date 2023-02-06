#!/bin/bash

set -e

DOTFILES_ROOT=$(git rev-parse --show-toplevel)
. "$DOTFILES_ROOT/misc/misc.sh"

info "setup $NAME"

if ! [ -f $XDG_CONFIG_HOME/git/config ]; then

    mkdir -p $XDG_CONFIG_HOME/git
    link_file "$SCRIPT_DIR/local" "$XDG_CONFIG_HOME/git/local"

    user '- What is your github auther name?'
    read -r git_authorname < /dev/tty
    user '- What is your github author email?'
    read -r git_authoremail < /dev/tty

    touch $XDG_CONFIG_HOME/git/config
    git config --global user.name "$git_authorname"
    git config --global user.email "$git_authoremail"

fi

git config --global include.path "local/local.conf"
# git config --global --add include.path "local/xxx.conf"

success "$NAME"
