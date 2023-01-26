#!/bin/bash

XDG_CONFIG_HOME=$HOME/.config
SCRIPT_DIR=$(dirname $(readlink -f $0))
NAME=$(basename "$SCRIPT_DIR")

info () {
  printf "\r[ \033[00;34m..\033[0m ] $1\n"
}

user () {
  printf "\r[ \033[0;33m??\033[0m ] $1\n"
}

success () {
  printf "\r\033[2K[ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K[\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

link_file() {
	local src=$1 dst=$2
	if ! [ -e "$dst" ]; then
		ln -s "$src" "$dst"
	fi
}

