# Remove ctrl-@
bindkey -r "^@"

bindkey "^[[1~" beginning-of-line # Home
bindkey "^[[4~" end-of-line       # End
bindkey '^U' backward-kill-line
bindkey '^f' forward-word
bindkey '^b' backward-word
