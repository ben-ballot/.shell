_pwait () {
        local _pids=$@ _timeout=10 _pid _cmdpid

        # No pwait equivalent on Linux. We wait for all processes to finish
        #  until $_timeout exprires
        if [ "x${_pids}" != "x" ];then
                ( for _pid in "${_pids}"
                do
                        ( while [ -d /proc/${_pid} ]; do sleep 0.5 ; done ) &
                done
                ) & _cmdpid=$!
                ( sleep ${_timeout} ; echo "Killing group pid $_cmdpid" ; kill -- -${_cmdpid} ) &
		echo "Waiting pid $_cmdpid"
                wait ${_cmdpid}

        fi
}
