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
