#---------------------------
# common
#---------------------------
function input-line() {
  BUFFER="$@"
  CURSOR=$#BUFFER
  zle redisplay
}

function ud() {
  eval "cd $(repeat ${1:-1}  printf "../")"
}

function fzf-select-history() {
  input-line $(history -10000 | tac | gsed -e 's/^\s*[0-9]\+\*\s\+//' -e 's/^\s*[0-9]\+\s\+//' | awk '!a[$0]++' | fzf --no-sort)
}
zle -N fzf-select-history
bindkey '^r' fzf-select-history

function fck() {
  local out query key
  while out=$(rg "$@" . | fzf --no-height -e --no-sort --query="$query" --print-query); do
    query=$(head -1 <<< "$out")
    file=$(sed '1d' <<< "$out" | awk -F : '{print $1}')
    line=$(sed '1d' <<< "$out" | awk -F : '{print $2}')
    [ -z "$file" ] && continue
    less -N -R +$line $file
  done
}

# fshow - git commit browser (enter for show, right for diff)
function fshow() {
  local out shas sha q k
  while out=$(
      git log --graph --color=always \
          --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
      fzf --ansi --multi --no-sort --reverse --query="$q" \
          --print-query --expect=right); do
    q=$(head -1 <<< "$out")
    k=$(head -2 <<< "$out" | tail -1)
    shas=$(sed '1,2d;s/^[^a-z0-9]*//;/^$/d' <<< "$out" | awk '{print $1}')
    [ -z "$shas" ] && continue
    if [ "$k" = right ]; then
      git diff --color=always $shas | less -R
    else
      for sha in $shas; do
        git show --color=always $sha | less -R
      done
    fi
  done
}

function gopen() {
  local out="$(ghq list | fzf)"
  [ -z "$out" ] && zle redisplay && return
  GITHUB_HOST="$(echo $out | cut -d '/' -f 1)" hub browse "$(echo $out | cut -d '/' -f 2,3)"
}


#---------------------------
# docker
#---------------------------
function fzf-docker-exec {
  local out=$(docker ps | fzf --header-lines=1 --query "$LBUFFER" | cut -d ' ' -f1)
  [ -z "$out" ] && zle redisplay && return
  input-line "docker exec -it $out "
}
zle -N fzf-docker-exec
bindkey '^@de' fzf-docker-exec


#---------------------------
# git
#---------------------------
# list ghq directory
function fzf-git-directory() {
  local out=$(ghq list | fzf)
  [ -z "$out" ] && zle redisplay && return
  input-line "cd "$(ghq root)/$out""
  zle accept-line
}
zle -N fzf-git-directory
bindkey '^@gd' fzf-git-directory

# checkout git branch
function fzf-git-branch() {
  local branches branch
  branches=$(git branch -vv --color=always) &&
  branch=$(echo "$branches" | fzf --ansi --no-multi) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
  zle accept-line
}
zle -N fzf-git-branch
bindkey '^@gb'  fzf-git-branch


#---------------------------
# kubernetes
#---------------------------
function fzf-kube-cluster() {
  local out=$(kubectl config get-clusters | fzf --header-lines=1 --query "$LBUFFER")
  [ -z "$out" ] && zle redisplay && return
  input-line "kubectl config use-context $out"
  zle accept-line
}
zle -N fzf-kube-cluster
bindkey '^@kc'  fzf-kube-cluster

function fzf-kube-namespace() {
    local out=$(kubectl get namespace | fzf --header-lines=1 --query "$LBUFFER" | cut -d ' ' -f1)
    [ -z "$out" ] && zle redisplay && return
    input-line "kubectl config set-context $(kubectl config current-context) --namespace=$out"
    zle accept-line
}
zle -N fzf-kube-namespace
bindkey '^@kn'  fzf-kube-namespace

function fzf-kube-exec() {
  local out=$(kubectl get pods | fzf --header-lines=1 --query "$LBUFFER" | cut -d ' ' -f1)
  [ -z "$out" ] && zle redisplay && return
  input-line "kubectl exec -it $(echo $out) "
  zle redisplay
}
zle -N fzf-kube-exec
bindkey '^@ke'  fzf-kube-exec

function fzf-kube-logs() {
  local out=$(kubectl get pods | fzf --header-lines=1 --query "$LBUFFER" | cut -d ' ' -f1)
  [ -z "$out" ] && zle redisplay && return
  input-line "kubectl logs $out"
  zle accept-line
}
zle -N fzf-kube-logs
bindkey '^@kl'  fzf-kube-logs

function fzf-kube-describe-pods() {
  local out=$(kubectl get pods | fzf --header-lines=1 --query "$LBUFFER" | cut -d ' ' -f1)
  [ -z "$out" ] && zle redisplay && return
  input-line "kubectl describe pods $(echo $out)"
  zle accept-line
}
zle -N fzf-kube-describe-pods
bindkey '^@kd' fzf-kube-describe-pods


#---------------------------
# SSH
#---------------------------
function fzf-ssh-known-host() {
  local out=$(cat $HOME/.ssh/config | grep 'Host ' | cut -d ' ' -f2 | fzf)
  [ -z "$out" ] && zle redisplay && return
  input-line "ssh $out"
  zle accept-line
}
zle -N fzf-ssh-known-host
bindkey '^@s' fzf-ssh-known-host
