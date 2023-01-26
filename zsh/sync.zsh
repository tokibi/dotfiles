setopt interactivecomments
setopt auto_list
setopt auto_menu

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# history
export HISTFILE="$XDG_STATE_HOME/zsh_history"
export HISTSIZE=10000
export SAVEHIST=10000
setopt hist_ignore_dups
setopt share_history
setopt extended_history

# completion
source <(kubectl completion zsh)

# hook
zshaddhistory() {
	local line="${1%%$'\n'}"
	# The following commands are not recorded in the history file.
	[[ ! "$line" =~ "^(cd|l[sal]|tig|lg|lazygit|rm|rmdir)($| )" ]]
}

# starship
eval "$(starship init zsh)"
