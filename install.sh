#!/bin/bash
echo "This script needs the following packages: "
echo "alien libaio1 unixodbc"
echo "Do you want to install these packages ?"
read -p "Are you sure you want to install these packages? "  -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
sudo apt install alien libaio1 unixodbc

else
while read -r -t 0; do read -r; done
sudo -s
sudo cat config > /sbin/chkconfig
sudo chmod 755 /sbin/chkconfig
sudo cat oracle-conf > /etc/sysctl.d/60-oracle.conf
sudo service procps start
sudo cat rc2-file > /etc/rc2.d/S01shm_load
sudo chmod 755 /etc/rc2.d/S01shm_load
sudo ln -s /usr/bin/awk /bin/awk 
sudo mkdir /var/lock/subsys 
sudo touch /var/lock/subsys/
echo ""
read -p "Do you want to install Oracle SqlPlus from the package? "  -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
echo "\nThis might take a while\n"
sudo dpkg --install oracle-xe_11.2.0-2_amd64.deb
fi
sudo /etc/init.d/oracle-xe configure 
echo "This might also take a while..."
echo "Oracle SQL-Plus is done configuring"
fi
