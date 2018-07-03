#!/bin/bash

set -e -o pipefail

SCRIPT="$(readlink -f "$0")"
SCRIPT_DIR="$(dirname "$SCRIPT")"
declare -a salt_opts

salt_opts+=(--local)
salt_opts+=("--file-root=$SCRIPT_DIR/states")
salt_opts+=("--pillar-root=$SCRIPT_DIR/pillar")
salt_opts+=(--retcode-passthrough)

salt_cmd=(state.apply "$@")


[ -x "$(which salt-call)" ]

if [[ "$1" == "--debug" ]]; then
    salt_opts+=(--log-level debug)
    shift
fi
if [[ "$1" == "--cmd" ]]; then
    shift
    salt_cmd=("$@")
fi

sudo salt-call "${salt_opts[@]}" \
    "${salt_cmd[@]}"
