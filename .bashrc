# Get the PATH of here
SCRIPT_PATH="$(dirname "${BASH_SOURCE[0]}")"

# Common stuff whatever the bash version / OS
export EDITOR=vim

# Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth:erasedups

# Huge history size (numbers are lines)
HISTSIZE=100000
HISTFILESIZE=200000

# Append to the history file, don't overwrite it
shopt -s histappend

# Save and reload the history after each command
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Only initialize Starship if the binary is found in the PATH
if command -v starship >/dev/null 2>&1; then
    eval "$(starship init bash)"
fi

# Load aliases
# shellcheck disable=SC1090
[ -f "${SCRIPT_PATH}"/aliases ] && . "${SCRIPT_PATH}"/aliases


######################################################
### Here begins the OS/Distribution specific stuff ###
######################################################

OS="$(uname -s)"

# Append your OS specific stuff here
case "$OS" in
    Linux)
        # Load Libraries
        while IFS= read -r -d '' lib; do
            # shellcheck disable=SC1090
            . "$lib"
        done <  <(find "${SCRIPT_PATH}"/lib/"$OS"/default -name "*.sh" -print0)
        ;;

    *)
        ;;
esac
