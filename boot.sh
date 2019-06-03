currentdir=$(dirname $(readlink -f "$0"))

#ip route add default via 192.168.1.79
cat ${currentdir}/hosts > /etc/hosts
