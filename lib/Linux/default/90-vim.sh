vs() {
    local servername
    local editor

    if [ "$1" = "--editor" ]; then
        editor=$2
        shift 2
    else
        editor=vim
    fi
    if [ -z "$VIM_SERVER" ]; then
        servername="vimserver"
    else
        servername="$VIM_SERVER"
    fi
    if [ $# -eq 0 ]; then
        "$editor" --servername "$servername"
    elif [ $# -eq 1 ]; then
        "$editor" --servername "$servername" --remote-silent "$@"
    else
        "$editor" -O2 --servername "$servername" --remote-silent "$@"
    fi
}

gvs() {
    vs --editor gvim "$@"
}

# vim: ft=sh
