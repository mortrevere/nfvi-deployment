git rev-parse HEAD
hostname
ip a | grep eno
df -h | grep sda
date
uptime
ping -w 1 -c 1 8.8.8.8 > /dev/null && echo 'internet up' || echo 'internet down'

