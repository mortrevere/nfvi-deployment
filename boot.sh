currentdir=$(dirname $(readlink -f "$0"))

#ip route add default via 192.168.1.79
#ip route add 10.190.7.0/24 via 192.168.1.79

openvpn /root/os-vpn/os-vpn.conf &

cat ${currentdir}/hosts > /etc/hosts
