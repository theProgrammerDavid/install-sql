# This is a script to install Oracle SQL Plus on an Ubuntu x64 platform

* Make ``install.sh`` and ``install_part2.sh`` as executable


- Download the ``.rpm`` package from  [here](https://www.oracle.com/database/technologies/xe-prior-releases.html). 
- To download the ``.rpm`` package, you will need to sign in with your oracle account that you can create for free.


For a Debian based system , download the package from (here)[https://drive.google.com/file/d/1Qh_XK-TNaU61-e-5_G5peii9_uj1j-uY/view]

Note: If for some reason, you are not able to download the ``.deb`` file, you can convert the ``.rpm`` package into a ``.deb`` using the following command
```bash
sudo alien --scripts -d oracle-xe-11.2.0-1.0.x86_64.rpm
```

- Once you download the file, place the downloaded in the ``install-sql`` folder.
- Then execute ``install.sh`` and then ``install_part2.sh``

- Once the script executes, add the contents of ``bashrc-conf`` to your terminal's source file.
If you're using the default ``bash`` terminal, use
```bash
cat bashrc-conf >> ~/.bashrc
```

- Once you are prompted for a username, enter the username as `sys as sysdba` and password as a single keyboard space.

- Once logged in, execute the following commands and replace USERNAME and PASSWORD by your a username and password of your choice
`create user USERNAME identified by PASSWORD;`

- if you get an error after the above step, execute `alter database open resetlogs;`

- if no error, execute the last command to give your user access to the database
`grant connect, resource to USERNAME;`