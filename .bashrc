# Get the PATH of here
SCRIPT_PATH="$(dirname "${BASH_SOURCE[0]}")"

# Common stuff whatever the bash version / OS
export EDITOR=vim

# History stuff
export HISTTIMEFORMAT="%d/%m/%y %T "
export PROMPT_COMMAND="history -a"

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
