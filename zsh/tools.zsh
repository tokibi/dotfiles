# llvm
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export LLVM_CONFIG=$(brew --prefix llvm)/bin/llvm-config

# diff
if which colordiff &> /dev/null; then
  alias diff='colordiff -u'
else
  alias diff='diff -u'
fi

# fzf
export FZF_DEFAULT_OPTS='--height 50% --reverse --border'

# gcloud
source "$HOMEBREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "$HOMEBREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
alias gcurl='curl --header "Authorization: Bearer $(gcloud auth print-identity-token)"'
export GOOGLE_APPLICATION_CREDENTIALS=~/.config/gcloud/application_default_credentials.json
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# less
export LESS='-R'
export LESSOPEN="| $HOMEBREW_PREFIX/bin/src-hilite-lesspipe.sh %s"

# shadowenv
eval "$(shadowenv init zsh)"

# openssl
export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include"

# mise
eval "$(mise activate zsh)"

# Android SDK
export ANDROID_HOME=$HOME/Library/Android/sdk && export PATH=$PATH:$ANDROID_HOME/emulator && export PATH=$PATH:$ANDROID_HOME/platform-tools
