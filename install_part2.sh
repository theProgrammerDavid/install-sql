sudo service oracle-xe start
echo "Enter your username for sqlplus"
read _UserName
sudo usermod -a -G dba $_UserName
sudo service oracle-xe start
sqlplus