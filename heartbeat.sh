#!/bin/bash

currentdir=$(dirname $(readlink -f "$0"))

${currentdir}/boot.sh
sleep 5
#nohup openvpn /root/os-vpn/os-vpn.conf > /var/log/os-vpn.log &
while true; do

cd ${currentdir} && git pull #fetch for updates
sleep 1
${currentdir}/report.sh | nc -q 2 leo-vaio 7777
#sleep 1
#${currentdir}/report.sh | nc -q 2 redpineap.pl 7777
sleep 8

done
