ps -ef | grep -v grep | grep 'nfvi-deployment/heartbeat' | awk '{print $2}' | xargs kill -15

/home/leo/nfvi-deployment/heartbeat.sh >/dev/null 2>&1 &
