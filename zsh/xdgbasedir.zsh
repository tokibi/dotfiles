# ref:
#   - https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
#   - https://wiki.archlinux.jp/index.php/XDG_Base_Directory
# $XDG_CONFIG_HOME defines the base directory relative to which user-specific configuration files should be stored.

# $XDG_DATA_HOME defines the base directory relative to which user-specific data files should be stored.

# The $XDG_STATE_HOME contains state data that should persist between (application) restarts, but that is not important
# or portable enough to the user that it should be stored in $XDG_DATA_HOME. It may contain:
#   - actions history (logs, history, recently used files, …)
#   - current state of the application that can be reused on a restart (view, layout, open files, undo history, …)
export LESSHISTFILE="$XDG_STATE_HOME/less_history"
export NODE_REPL_HISTORY="$XDG_STATE_HOME/node_history"
export SQLITE_HISTORY="$XDG_STATE_HOME/sqlite_history"
export MYSQL_HISTFILE="$XDG_STATE_HOME/mysql_history"
export PSQL_HISTORY="$XDG_STATE_HOME/psql_history"
