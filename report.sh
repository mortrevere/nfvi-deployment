git rev-parse HEAD
hostname
ip a | grep eno
df -h | grep sda
date +%R:%S
uptime
ping -w 1 -c 1 8.8.8.8 > /dev/null && echo 'internet up' || echo 'internet down'
echo 'LANPING'
cat /etc/hosts | cut -f1 | grep -Ev '#|127.0.' | xargs -L 1 ping -c1 -w1 2> /dev/null | grep -A 1 PING
