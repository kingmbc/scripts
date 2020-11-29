if [ "$1" == "docker" ]; then
	echo "[STOP] Docker Instance"
	docker stop zeppelin
	docker rm zeppelin
else
	echo "[STOP] Local Instance"
	/home/kingmbc-ubuntu/workspace/zeppelin-0.7.3-bin-all/bin/zeppelin-daemon.sh stop
fi
