#!/bin/bash

set -e -o pipefail

SCRIPT="$(readlink -f "$0")"
SCRIPT_DIR="$(dirname "$SCRIPT")"

[ -x "$(which salt-call)" ]

sudo salt-call --local \
    --file-root="$SCRIPT_DIR"/salt \
    --pillar-root="$SCRIPT_DIR"/pillar \
    --retcode-passthrough \
    state.apply \
    "$@"
