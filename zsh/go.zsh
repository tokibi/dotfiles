if which go &> /dev/null; then
  export GOPATH="$HOME"
  export GOBIN=$GOPATH/bin
  export PATH=$PATH:$GOPATH/bin
  export GO111MODULE=on
fi
