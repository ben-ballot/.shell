#!/bin/bash

openstack_push_image() {
    local -a args
    local name="$1"

    args+=("--disk-format" "qcow2")
    args+=("--min-disk" "5")
    args+=("--min-ram" "256")
    args+=("--container-format" "bare")
    args+=("--property" "img_config_drive=mandatory")
    args+=("--file" "$2")

    echo openstack image create "$name" "${args[@]}"
    openstack image create "$name" "${args[@]}"
}
