#!/bin/bash

currentdir=$(pwd)

if [ "$EUID" -ne 0 ]
  then echo "This needs to be run as root"
  exit
fi

IDN=$(cut -d '-' -f2 <<< $(hostname))

apt update
apt -y upgrade
apt -y install dfc htop nano software-properties-common net-tools iproute iputils-ping iperf tcpdump netcat

echo 'root:root' |chpasswd
sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
mkdir /root/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDdwLcy4I1WBVCqTrhku3uVQ/bbXoatNuOm0k4rlctABC4mSACLvuIMIdXKUXdNisOgJ9FDUvL+jK3Jks9gi1AeDL0mP3cCBWu951pkI3j13SW78rKG5qUHfXbmiV2KfxTaVmLDXQTh2cy0+AJ7iuQIvglm5vSRmLSTg81UzxlEElb+wRiIwBPgMqD0yWb7HuRngBkQLS0ioydxOE9NQ4k/chCcLee5d1MEtHN9K28P6UdGqJcxKnrGyCoOiJygdBfHaYhjHyMYpV1hWNKY8vxODrd4Ja8iKXV1tdya1bNAt6eEyeIFDpRU8VunT+XL7YNzTcQdurGGnAwf7CENlWYh mortrevere@leo-vaio" > /root/.ssh/authorized_keys

add-apt-repository -y cloud-archive:stein
apt update
apt -y install python-openstackclient

(echo "@reboot ${currentdir}/heartbeat.sh &") | crontab -

apt -y purge ureadahead

cat <<EOF > /etc/netplan/99_config.yaml
network:
  version: 2
  renderer: networkd
  ethernets:
    eno1:
      dhcp4: no
      addresses:
        - 192.168.1.1$IDN/24
      gateway4: 192.168.1.79
      nameservers:
          addresses: [208.67.222.222, 208.67.220.220]

EOF
netplan apply

read -rsn1 -p"Press any key to reboot or Ctrl-C to keep going";echo
reboot
