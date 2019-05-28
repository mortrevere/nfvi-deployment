#!/bin/bash

SCRIPT=$(readlink -f "$0")
currentdir=$(dirname "$SCRIPT")

while true; do

cd ${currentdir} && git pull #fetch for updates
sleep 1
${currentdir}/report.sh | nc -q 2 192.168.1.79 7777
#sleep 1
#${currentdir}/report.sh | nc -q 2 redpineap.pl 7777
sleep 40

done
