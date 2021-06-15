#!/bin/bash

mkdir /root/.ssh
cp /home/vagrant/.ssh/authorized_keys /root/.ssh/authorized_keys

cat << EOF >> /root/.ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAlUaidCe15lh3lDdKDAIvZn5IJR+hqraU6YtEmYnfFi1SDRc2RKPgci+qL3wBpi2kiCefY/+Xwz31/XApKB2mxB6HYHyjNMBClSVvTG/JoADcHUk/qjfJ+PPbl2//lK8TVU8y78F4dv7AXJrPDXYJD6iERPT5+Fgo6SYC9d1tG7iyTHGlpSjUhK9wuc7rtumz7A1NA5Ah4yyCuZfHtmsLHPgwfGZYBbMET5HwR0sDW0jazeSYS4Ob/nb77cETGSWpAuRXo0PHDVVmKd/sp6e0y2iBrb3AiZd0Ty1gRH7R12B4bgBP7yII/3RTav2XSYxMHQ6quSW08JJlnhezC20Aww== rsa-key-20150723
EOF

cat << EOF > /etc/hosts
127.0.0.1       localhost
172.16.16.101 node-1.example.com node-1
172.16.16.102 node-2.example.com node-2
172.16.16.103 node-3.example.com node-3

# The following lines are desirable for IPv6 capable hosts
::1     localhost ip6-localhost ip6-loopback
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
EOF

sed -i.bak 's|us.archive.ubuntu.com|mirror.yandex.ru|g' /etc/apt/sources.list
apt update
#apt dist-upgrade -y
apt install -y python3 python3-pip #nfs-common
#python3 -m pip install -U pip
#pip3 install ansible --upgrade requests
