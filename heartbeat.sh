#!/bin/bash

SCRIPT=$(readlink -f "$0")
currentdir=$(dirname "$SCRIPT")

while true; do

${currentdir}/report.sh | nc -q 2 10.206.19.130 7777
sleep 30

done
