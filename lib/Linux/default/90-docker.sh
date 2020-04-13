# Docker related functions
if ! DOCKER=$(which docker) ;then
	return
fi

my_docker_clean () {
	local container arg1=$1
	if [ "$arg1" = "-n" ];then
		MY_DRY_RUN=1
	fi
	for container in $($DOCKER ps  -f=status=exited -q)
	do
		# If the container contains volumes (not mapped one, volumes like "VOLUME" in Dockerfile), DO NOT CLEAN IT !
		if $DOCKER inspect --format='{{.Volumes}}' $container | egrep '/var/lib/docker/volumes/.*/_data' | egrep -v '^map' >/dev/null 2>&1 ; then
			my_verbose "Docker $container contains VOLUMES, skipped"
		else
			my_dry_run $DOCKER rm $container
		fi
	done
}
