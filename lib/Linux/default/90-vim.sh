#!/bin/bash

vs() {
    local servername
    local editor
    local session_dir
    local vim_args=()

    session_dir="${HOME}/.vim/sessions"
    if [[ ! -d "${HOME}" ]]; then
        mkdir -p "${session_dir}"
    fi
    if [ "$1" = "--editor" ]; then
        editor=$2
        shift 2
    else
        editor=vim
    fi
    if [ -z "$VS" ]; then
        servername="vimserver"
    else
        servername="$VS"
        session_file="${session_dir}/${servername}.vim"
        if [[ -f "${session_file}" ]]; then
            vim_args+=(-S "${session_file}")
        fi
        vim_args+=(--servername "${servername}" -c "Obsess ${session_file}")
    fi
    vim_args+=(--servername "${servername}")

    if [ $# -eq 1 ]; then
        vim_args+=(--remote-silent)
    elif [ $# -gt 1 ]; then
        vim_args+=(-O2)
    fi
    "${editor}" "${vim_args[@]}" "$@"
}

gvs() {
    vs --editor gvim "$@"
}

setvs() {
    local curdir
    curdir="$(basename ${PWD})"

    export VS="${curdir}"
}

# vim: ft=sh
