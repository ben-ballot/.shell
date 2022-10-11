if [ -d "$HOME/.virtualenvs" ];then
    export WORKON_HOME="$HOME/.virtualenvs"
    alias venv="source /usr/share/virtualenvwrapper/virtualenvwrapper.sh"
    source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
fi
