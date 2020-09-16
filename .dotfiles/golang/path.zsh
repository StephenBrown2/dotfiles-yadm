# Golang environment variables
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"

mkdir -p "$GOBIN" "$GOPATH/src/github.com/"

path=($path $GOBIN)