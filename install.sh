#!/bin/bash
echo "This script needs the following packages: "
echo "alien libaio1 unixodbc"
echo "Do you want to install these packages ?"

#check if the file exists
if [[ ! -f "./oracle.deb" ]]
then
    wget 'https://www.dropbox.com/s/i0i2otpryp7xjpm/oracle-xe_11.2.0-2_amd64.deb?dl=1' -O oracle.deb
fi

#sudo -s
sudo cat config > /sbin/chkconfig
sudo chmod 755 /sbin/chkconfig
sudo cat oracle-conf > /etc/sysctl.d/60-oracle.conf
sudo service procps start
sudo cat rc2-file > /etc/rc2.d/S01shm_load
sudo chmod 755 /etc/rc2.d/S01shm_load
sudo ln -s /usr/bin/awk /bin/awk 
sudo mkdir /var/lock/subsys 
sudo touch /var/lock/subsys/

echo "Installing SQL Plus from the package.."

echo "\nThis might take a while\n"
sudo dpkg --install oracle.deb

sudo /etc/init.d/oracle-xe configure 
echo "This might also take a while..."
echo "Oracle SQL-Plus is done configuring"
echo "Enter your username for sqlplus"
read _UserName

sudo usermod -a -G dba $_UserName
