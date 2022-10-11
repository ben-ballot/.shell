#!/bin/bash

tmux_ssh_synced() {

    mapfile -d " " hosts < <(echo "${@}")
    tmux new-window "ssh synced ${hosts[0]}"
    for host in "${hosts[@]}"; do
        tmux split-window -h "ssh ${host}"
        tmux select-layout tiled > /dev/null
    done
    tmux select-pane -t 0
    tmux set-window-option synchronize-panes on >/dev/null
}
