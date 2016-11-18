GOROOT="$HOME"/go
GOPATH="$HOME"/dev/go

[ -d "$GOROOT"/bin ] &&  {
    export GOROOT="$GOROOT"
    export PATH="$GOROOT"/bin:"$PATH"
}
[ -d "$GOPATH" ] && {
    export GOPATH="$GOPATH"
    export PATH="$GOPATH"/bin:"$PATH"
}
