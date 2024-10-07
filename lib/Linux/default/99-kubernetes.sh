#!/bin/bash
# Enable completion if kubectl is found

# shellcheck disable=SC2039
if which kubectl &> /dev/null; then
    # shellcheck disable=SC2039 disable=SC1090
    . <(kubectl completion bash)
fi
# Enable completion if helm is found
# shellcheck disable=SC2039
if which helm &> /dev/null; then
    # shellcheck disable=SC2039 disable=SC1090
    . <(helm completion bash)
fi

# add to your shell startup script (e.g: $HOME/.bashrc).
# install [fzf](https://github.com/junegunn/fzf)

kctx() {
    local kubeconfig_dir="${HOME}/.kube"
    if ! [ -d "${kubeconfig_dir}" ]; then
        echo "No ${kubeconfig_dir} exists"
        return
    fi
    local SEARCH="${1:-${HOME}/.kube}"
    local KUBE
    KUBE="$(find "${SEARCH}" -type f -name "*.kubeconfig" | fzf)"
    [[ -n "$KUBE" ]] && ln -sf "$KUBE" "${kubeconfig_dir}/config"
}

klctx() {
    local kubeconfig_dir="${HOME}/.kube"
    local SEARCH="${1:-${kubeconfig_dir}}"
    if ! [ -d "${kubeconfig_dir}" ]; then
        echo "No ${kubeconfig_dir} exists"
        return
    fi
    local KUBE
    KUBE="$(find "${SEARCH}" -type f -name "*.kubeconfig" | fzf)"
    if [[ -n "$KUBE" ]]; then
      #export KUBECONFIG="${SEARCH%/}/$KUBE"
      export KUBECONFIG="$KUBE"
    fi
}
