#!/bin/bash

timedatectl set-timezone Asia/Ho_Chi_Minh
echo "DefaultLimitNOFILE=65535" >> /etc/systemd/user.conf

echo "DefaultLimitNOFILE=65535" >> /etc/systemd/system.conf 
echo  "fs.file-max = 65535" >> /etc/sysctl.conf
sudo sysctl -p

# /etc/security/limits.conf
echo "*         hard    nofile	65535" >> /etc/security/limits.conf
echo "*         soft    nofile	65535" >> /etc/security/limits.conf
#echo "*         hard    nproc   65535" >> /etc/security/limits.conf
#echo "*         soft    nproc	65535" >> /etc/security/limits.conf
echo "www-data  soft	nofile	65535" >> /etc/security/limits.conf
echo "www-data  hard	nofile  65535" >> /etc/security/limits.conf
echo "root	soft	nofile  65535" >> /etc/security/limits.conf
echo "root	hard	nofile	65535" >> /etc/security/limits.conf
#echo "www-data  soft    nproc  65535" >> /etc/security/limits.conf
#echo "www-data  hard    nproc  65535" >> /etc/security/limits.conf
#echo "root      soft    nproc  65535" >> /etc/security/limits.conf
#echo "root      hard    nproc  65535" >> /etc/security/limits.conf
echo "session required pam_limits.so">> /etc/pam.d/common-session


reboot
