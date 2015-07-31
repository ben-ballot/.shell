my_pwait () { 
        # We wait for all processes to finish until $_timeout expires 
        local _pids=$@ _timeout=10 _pid _cmdpid 
 
        # Create a subshell which will test the processes and get the pid of 
        #  said subshell 
        ( for _pid in ${_pids} 
        do 
                # Check the existence of the directory related to the 
                #  the pid in proc fs each second 
                ( while [ -d /proc/${_pid} ]; do sleep 1 ; done ) &  
        done 
        ) & _cmdpid=$! 
        # in another subshell, wait $_timeout then kill the subshell checking 
        #  the existence of PIDs, avoiding being stuck checking 
        ( sleep ${_timeout} ; kill -- -${_cmdpid} 2>/dev/null ) & 
        wait ${_cmdpid} 
}

my_dry_run () {
	if [ "$MY_DRY_RUN" = "1" ];then
		echo $@
	else
		if [ "$MY_VERBOSE" = "1" ];then
			echo $@
		fi
		$@
	fi
}

my_verbose () {
	if [ "$MY_VERBOSE" = "1" ];then
		echo $@
	fi
}
