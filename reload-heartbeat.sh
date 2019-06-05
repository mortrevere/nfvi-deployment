pid=$(ps aux | grep 'nfvi-deployment/heartbeat' | grep -v grep | cut -d' ' -f7)
kill -15 $pid
/home/leo/nfvi-deployment/heartbeat.sh &
