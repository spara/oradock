# ORADOCK

To start oracle

```
docker run -d --env-file ./env_params -p 1521:1521 -p 5500:5500 -it --name dockerDB --shm-size="8g" manomarks/oracledb:standard
```

Start up can take several minutes, to check to see if the database is started, log into the container and check the setupDB.log

```
> docker exec -it dockerDB /bin/bash

# in container shell

[root@d5b7ed8f8408 /]# su - oracle
[oracle@d5b7ed8f8408 ~]$ cat ~/setup/log/setupDB.log
Oracle Database 12.1.0.2 Setup
Wed Apr 5 19:34:11 UTC 2017

Check parameters ......
log file is : /home/oracle/setup/log/paramChk.log
paramChk.sh is done at 0 sec

untar DB bits ......
log file is : /home/oracle/setup/log/untarDB.log
untarDB.sh is done at 140 sec

config DB ......
log file is : /home/oracle/setup/log/configDB.log
configDB.sh is done at 413 sec

Done ! The database is ready for use .
[oracle@d5b7ed8f8408 ~]$
```

To launch sqlplus:

```
[oracle@d5b7ed8f8408 ~]$sqlplus sys/MyPasswd123@OraDoc as SYSDBA

SQL*Plus: Release 12.1.0.2.0 Production on Thu Apr 6 01:05:47 2017

Copyright (c) 1982, 2014, Oracle.  All rights reserved.


Connected to:
Oracle Database 12c Standard Edition Release 12.1.0.2.0 - 64bit Production

SQL>
```

