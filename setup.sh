#!/bin/bash

set -e

DOTFILES_ROOT=$(git rev-parse --show-toplevel)
. "$DOTFILES_ROOT/misc/misc.sh"

restore_brewfile() {
	if ! type brew > /dev/null; then
		fail 'homebrew not installed'
	fi

	if ! brew bundle --no-upgrade --quiet check > /dev/null; then
		info 'restore brewfile'

		eval "$(/opt/homebrew/bin/brew shellenv)"
		brew bundle --no-lock

		success 'restore brewfile'
	fi
}

setup_zsh() {
	info 'setup zsh'

	link_file $DOTFILES_ROOT/zsh $XDG_CONFIG_HOME/zsh
	link_file $DOTFILES_ROOT/zsh/sheldon.plugins.toml $XDG_CONFIG_HOME/sheldon/plugins.toml
	echo 'export ZDOTDIR=$HOME/.config/zsh' > $HOME/.zshenv

	success 'zsh'
}

setup_apps() {
	find $DOTFILES_ROOT -type f -name "install.sh" -print0 | xargs -n1 -0 bash
}

restore_brewfile
setup_zsh
setup_apps

success 'setup complete'
