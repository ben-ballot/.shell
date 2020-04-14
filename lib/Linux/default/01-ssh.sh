#!/bin/bash

typeset SSH_ENV="$HOME/.ssh/environment"

function start_agent {
     echo "Initialising new SSH agent..."
     /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
     echo succeeded
     chmod 600 "${SSH_ENV}"
     # shellcheck disable=SC1090
     source "${SSH_ENV}" > /dev/null
     for ssh_key in \
        "${HOME?}"/.ssh/id_rsa.pub \
        "${HOME?}"/.ssh/id_ecdsa.pub \
        "${HOME?}"/.ssh/id_ed25519.pub; do
        if [ -f "${ssh_key}" ]; then
            echo "Adding ssh-key ${ssh_key}"
            /usr/bin/ssh-add "${ssh_key%*.pub}"
        fi
     done
}

# Start agent if needed
if [ "$(pgrep -u "${UID?}" ssh-agent \
    || pgrep -u "${UID?}" gnome-keyring)" == "" ]; then
    start_agent
fi

# Reattach agent when connecting to tmux
if [[ -S "${SSH_AUTH_SOCK?}" && ! -h "${SSH_AUTH_SOCK?}" ]]; then
    ln -sf "${SSH_AUTH_SOCK?}" ~/.ssh/ssh_auth_sock;
fi
export SSH_AUTH_SOCK="$HOME"/.ssh/ssh_auth_sock;
