#!/bin/bash

currentdir=$(pwd)

while true; do

${currentdir}/report.sh | nc -q 2 10.206.19.130 7777
sleep 30

done
