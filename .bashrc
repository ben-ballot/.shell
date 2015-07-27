# Get the PATH of here
SCRIPT_PATH=$(dirname ${BASH_SOURCE[0]})

# Common stuff whatever the bash version / OS
export EDITOR=vim


# Load aliases
[ -f ${SCRIPT_PATH}/aliases ] && . ${SCRIPT_PATH}/aliases


######################################################
### Here begins the OS/Distribution specific stuff ###
######################################################

OS="$(uname -s)"

# Append your OS specific stuff here
case "$OS" in
	Linux)
		# Load Libraries
		for lib in $(find ${SCRIPT_PATH}/lib/$OS/default -name "*.sh")
		do
			. $lib
		done
		;;

	*)
		;;
esac
