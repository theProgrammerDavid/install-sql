#!/bin/bash

sudo -s

unzip oracle-xe-11.2.0-1.0.x86_64.rpm.zip 
sudo apt-get install alien libaio1 unixodbc
cd Disk1/

sudo cat config > /sbin/chkconfig

echo "This may take a while...."
sudo alien --scripts -d oracle-xe-11.2.0-1.0.x86_64.rpm

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

sudo cat bashrc-conf >> ~/.bashrc

. ~/.bashrc

sudo service oracle-xe start
echo "Enter your username for sqlplus"
read _UserName

sudo usermod -a -G dba $_UserName

sudo service oracle-xe start
sqlplus

