if [ "$1" == "docker" ]; then
	echo "[START] Docker Instance"
	PROC_NAME='zeppelin'

	if [ ! "$(docker ps -q -f name=$PROC_NAME)" ]; then
		if [ "$(docker ps -aq -f status=exited -f name=$PROC_NAME)" ]; then
		# cleanup
		docker rm $PROC_NAME
		fi
	# run your container
	docker run -d -p 8080:8080 -v $PWD/logs:/logs -v $PWD/notebook:/notebook -e ZEPPELIN_LOG_DIR='/logs' -e ZEPPELIN_NOTEBOOK_DIR='/notebook' --name zeppelin dylanmei/zeppelin
	fi

else
	echo "[START] Local Instance"
	/home/kingmbc-ubuntu/workspace/zeppelin-0.7.3-bin-all/bin/zeppelin-daemon.sh start
fi
