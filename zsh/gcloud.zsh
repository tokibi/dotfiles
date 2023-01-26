source "$HOMEBREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "$HOMEBREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
alias gcurl='curl --header "Authorization: Bearer $(gcloud auth print-identity-token)"'
export GOOGLE_APPLICATION_CREDENTIALS=~/.config/gcloud/application_default_credentials.json
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

