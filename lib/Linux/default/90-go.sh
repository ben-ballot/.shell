GOROOT="$HOME"/go
GOPATH="$HOME"/dev/go

[ -d "$GOROOT"/bin ] &&  {
    export GOROOT="$GOROOT"
    export PATH="$GOROOT"/bin:"$PATH"
}
if [ -d "$GOPATH" ]; then
    export GOPATH="$GOPATH"
    export PATH="$GOPATH"/bin:"$PATH"
fi
