#!/bin/bash
for i in {1..4}
do
   #ssh root@nfvi-$i "echo -e && echo '---------' && hostname && $@ && echo '--------' " &
   ssh root@nfvi-$i "$@" &
done
wait
echo "done"
