# Ubuntu x64 python installer script for Oracle SQL Plus 

  ## Windows

- Windows [32 bit](https://drive.google.com/file/d/1syJJOFX5NXgRgPlRmkckz-PQYrJqDvjK/view?usp=sharing) and [64 bit](https://drive.google.com/open?id=1Fe1lxZMBJMn2uWGwIQPn9OcEllrx_arX). Unzip the download and run ```DISK1/setup.exe``` 
- Follow the installer instructions.

## Resources

- Download the ``.rpm`` package from the [official oracle website](https://www.oracle.com/database/technologies/xe-prior-releases.html).
* For a Debian based system , download the package from [here](https://drive.google.com/file/d/1Qh_XK-TNaU61-e-5_G5peii9_uj1j-uY/view)

  

Note: If for some reason, you are not able to download the ``.deb`` file, you can convert the ``.rpm`` package into a ``.deb`` using the following command

```bash

sudo alien --scripts -d oracle-xe-11.2.0-1.0.x86_64.rpm

```

## Installation
  
```python
python3 setup.py
```
 The script will start the download of the package and install it. You will be prompted for your root password.

- Once you are prompted for a username, enter the username as `sys as sysdba` and password as a single keyboard space.

- Once logged in, execute the following commands and replace ```USERNAME``` and ```PASSWORD``` by your a username and password of your choice
`create user USERNAME identified by PASSWORD;`

- if you get an error after the above step, execute 
`alter database open resetlogs;`

- if no error, execute the last command to give your user access to the database
`grant connect, resource to USERNAME;`
