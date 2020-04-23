#!/bin/bash
echo "This script needs the following packages: "
echo "alien libaio1 unixodbc"
echo "Do you want to install these packages ?"
sudo apt install alien libaio1 unixodbc
cd Disk1/
sudo -s
sudo cat config > /sbin/chkconfig
sudo chmod 755 /sbin/chkconfig
sudo cat oracle-conf > /etc/sysctl.d/60-oracle.conf
sudo service procps start
sudo cat rc2-file > /etc/rc2.d/S01shm_load
sudo chmod 755 /etc/rc2.d/S01shm_load
sudo ln -s /usr/bin/awk /bin/awk 
sudo mkdir /var/lock/subsys 
sudo touch /var/lock/subsys/listener
sudo dpkg --install oracle-xe_11.2.0-2_amd64.deb
echo "This might also take a while..."
sudo /etc/init.d/oracle-xe configure 
echo "Oracle SQL-Plus is done configuring"