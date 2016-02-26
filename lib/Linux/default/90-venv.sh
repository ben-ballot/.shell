if [ -d "$HOME/virtualenv" ];then
    export WORKON_HOME="$HOME/virtualenv"
    alias venv="source /usr/share/virtualenvwrapper/virtualenvwrapper.sh"
fi
