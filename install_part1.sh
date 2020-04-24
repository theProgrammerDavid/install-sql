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