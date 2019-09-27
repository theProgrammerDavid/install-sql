# This is a script to install Oracle SQL Plus on an Ubuntu x64 platform

- you will need to download the linux package [here](https://www.oracle.com/database/technologies/xe-prior-releases.html). 

- To download the package, you will need to sign in with your oracle account that you can create for free.

- Once you download the file, place this script in the same folder as the package and run it.

- Once you are prompted for a username, enter the username as `sys as sysdba` and password as a single keyboard space.

- Once logged in, execute the following commands and replace USERNAME and PASSWORD by your a username and password of your choice
`create user USERNAME identified by PASSWORD;`

- if you get an error after the above step, execute `alter database open resetlogs;`

- if no error, execute the last command to give your user access to the database
`grant connect, resource to USERNAME;`