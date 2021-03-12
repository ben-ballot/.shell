# Activcate mojo

if command -v mojo >/dev/null 2>&1; then
    export MOJO_ROOT="${HOME}"/.local/share/mojo
    if [ ! -d "${MOJO_ROOT}" ]; then
        mkdir -p "${MOJO_ROOT}"
    fi
fi
