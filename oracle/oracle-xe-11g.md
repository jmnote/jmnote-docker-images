Build
```
root@localhost:~/jmnote-docker-images/scripts# ./docker-oracle-xe-11g.sh
++ rm -rf /tmp/jmnote-docker-images
++ mkdir /tmp/jmnote-docker-images
++ cd /tmp/jmnote-docker-images
++ git clone --depth=1 https://github.com/wnameless/docker-oracle-xe-11g.git
Cloning into 'docker-oracle-xe-11g'...
remote: Enumerating objects: 17, done.
remote: Counting objects: 100% (17/17), done.
remote: Compressing objects: 100% (15/15), done.
remote: Total 17 (delta 0), reused 11 (delta 0), pack-reused 0
Unpacking objects: 100% (17/17), done.
++ cd docker-oracle-xe-11g
++ docker build -t jmnote/oracle-xe-11g:11.2.0 .
Sending build context to Docker daemon  551.6MB
Step 1/7 : FROM ubuntu:18.04
18.04: Pulling from library/ubuntu
7ddbc47eeb70: Pull complete
c1bbdc448b72: Pull complete
8c3b70e39044: Pull complete
45d437916d57: Pull complete
Digest: sha256:6e9f67fa63b0323e9a1e587fd71c561ba48a034504fb804fd26fd8800039835d
Status: Downloaded newer image for ubuntu:18.04
 ---> 775349758637
Step 2/7 : COPY assets /assets
 ---> 4b0940636b08
Step 3/7 : RUN /assets/setup.sh
 ---> Running in 3a9796b6554c
Get:1 http://security.ubuntu.com/ubuntu bionic-security InRelease [88.7 kB]
Get:2 http://archive.ubuntu.com/ubuntu bionic InRelease [242 kB]
Get:3 http://security.ubuntu.com/ubuntu bionic-security/restricted amd64 Packages [16.8 kB]
Get:4 http://security.ubuntu.com/ubuntu bionic-security/multiverse amd64 Packages [6508 B]
Get:5 http://security.ubuntu.com/ubuntu bionic-security/main amd64 Packages [736 kB]
Get:6 http://archive.ubuntu.com/ubuntu bionic-updates InRelease [88.7 kB]
Get:7 http://archive.ubuntu.com/ubuntu bionic-backports InRelease [74.6 kB]
Get:8 http://security.ubuntu.com/ubuntu bionic-security/universe amd64 Packages [789 kB]
Get:9 http://archive.ubuntu.com/ubuntu bionic/main amd64 Packages [1344 kB]
Get:10 http://archive.ubuntu.com/ubuntu bionic/multiverse amd64 Packages [186 kB]
Get:11 http://archive.ubuntu.com/ubuntu bionic/restricted amd64 Packages [13.5 kB]
Get:12 http://archive.ubuntu.com/ubuntu bionic/universe amd64 Packages [11.3 MB]
Get:13 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 Packages [1032 kB]
Get:14 http://archive.ubuntu.com/ubuntu bionic-updates/multiverse amd64 Packages [9578 B]
Get:15 http://archive.ubuntu.com/ubuntu bionic-updates/restricted amd64 Packages [30.0 kB]
Get:16 http://archive.ubuntu.com/ubuntu bionic-updates/universe amd64 Packages [1315 kB]
Get:17 http://archive.ubuntu.com/ubuntu bionic-backports/universe amd64 Packages [4235 B]
Get:18 http://archive.ubuntu.com/ubuntu bionic-backports/main amd64 Packages [2496 B]
Fetched 17.3 MB in 7s (2563 kB/s)
Reading package lists...
Reading package lists...
Building dependency tree...
Reading state information...
The following additional packages will be installed:
  libreadline7 readline-common
Suggested packages:
  readline-doc
The following NEW packages will be installed:
  bc libaio1 libreadline7 net-tools readline-common
0 upgraded, 5 newly installed, 0 to remove and 0 not upgraded.
Need to get 463 kB of archives.
After this operation, 1548 kB of additional disk space will be used.
Get:1 http://archive.ubuntu.com/ubuntu bionic/main amd64 readline-common all 7.0-3 [52.9 kB]
Get:2 http://archive.ubuntu.com/ubuntu bionic/main amd64 libreadline7 amd64 7.0-3 [124 kB]
Get:3 http://archive.ubuntu.com/ubuntu bionic/main amd64 bc amd64 1.07.1-2 [86.2 kB]
Get:4 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 libaio1 amd64 0.3.110-5ubuntu0.1 [6476 B]
Get:5 http://archive.ubuntu.com/ubuntu bionic/main amd64 net-tools amd64 1.60+git20161116.90da8a0-1ubuntu1 [194 kB]
debconf: delaying package configuration, since apt-utils is not installed
Fetched 463 kB in 2s (233 kB/s)
Selecting previously unselected package readline-common.
(Reading database ... 4046 files and directories currently installed.)
Preparing to unpack .../readline-common_7.0-3_all.deb ...
Unpacking readline-common (7.0-3) ...
Selecting previously unselected package libreadline7:amd64.
Preparing to unpack .../libreadline7_7.0-3_amd64.deb ...
Unpacking libreadline7:amd64 (7.0-3) ...
Selecting previously unselected package bc.
Preparing to unpack .../archives/bc_1.07.1-2_amd64.deb ...
Unpacking bc (1.07.1-2) ...
Selecting previously unselected package libaio1:amd64.
Preparing to unpack .../libaio1_0.3.110-5ubuntu0.1_amd64.deb ...
Unpacking libaio1:amd64 (0.3.110-5ubuntu0.1) ...
Selecting previously unselected package net-tools.
Preparing to unpack .../net-tools_1.60+git20161116.90da8a0-1ubuntu1_amd64.deb ...
Unpacking net-tools (1.60+git20161116.90da8a0-1ubuntu1) ...
Setting up readline-common (7.0-3) ...
Setting up libreadline7:amd64 (7.0-3) ...
Setting up libaio1:amd64 (0.3.110-5ubuntu0.1) ...
Setting up bc (1.07.1-2) ...
Setting up net-tools (1.60+git20161116.90da8a0-1ubuntu1) ...
Processing triggers for libc-bin (2.27-3ubuntu1) ...
Selecting previously unselected package oracle-xe.
(Reading database ... 4140 files and directories currently installed.)
Preparing to unpack .../oracle-xe_11.2.0-1.0_amd64.deb ...
Unpacking oracle-xe (11.2.0-1.0) ...
Setting up oracle-xe (11.2.0-1.0) ...
Executing post-install steps...
You must run '/etc/init.d/oracle-xe configure' as the root user to configure the database.

Processing triggers for libc-bin (2.27-3ubuntu1) ...

Oracle Database 11g Express Edition Configuration
-------------------------------------------------
This will configure on-boot properties of Oracle Database 11g Express
Edition.  The following questions will determine whether the database should
be starting upon system boot, the ports it will use, and the passwords that
will be used for database accounts.  Press <Enter> to accept the defaults.
Ctrl-C will abort.

Specify the HTTP port that will be used for Oracle Application Express [8080]:
Specify a port that will be used for the database listener [1521]:
Specify a password to be used for database accounts.  Note that the same
password will be used for SYS and SYSTEM.  Oracle recommends the use of
different passwords for each database account.  This can be done after
initial configuration:
Confirm the password:

Do you want Oracle Database 11g Express Edition to be started on boot (y/n) [y]:
Starting Oracle Net Listener...Done
Configuring database...Done
Starting Oracle Database 11g Express Edition instance...Done
Installation completed successfully.

Profile altered.


Profile altered.


User altered.


Session altered.


PL/SQL procedure successfully completed.


Commit complete.

Removing intermediate container 27bb556fcd9d
 ---> 78526630d993
Step 4/7 : EXPOSE 22
 ---> Running in 826e20f5760e
Removing intermediate container 826e20f5760e
 ---> 32cb24cce9c8
Step 5/7 : EXPOSE 1521
 ---> Running in 455e9c6ba3c7
Removing intermediate container 455e9c6ba3c7
 ---> 1794e5e701f1
Step 6/7 : EXPOSE 8080
 ---> Running in dc1e02d1fe78
Removing intermediate container dc1e02d1fe78
 ---> 2cffa695deab
Step 7/7 : CMD /usr/sbin/startup.sh && tail -f /dev/null
 ---> Using cache
 ---> 3b0d7bc2d2bd
Successfully built 3b0d7bc2d2bd
Successfully tagged jmnote/oracle-xe-11g:11.2.0
++ docker push jmnote/oracle-xe-11g:11.2.0
The push refers to repository [docker.io/jmnote/oracle-xe-11g]
5fe1442333dd: Pushed
65321206f7ce: Pushed
e0b3afb09dc3: Mounted from library/ubuntu
6c01b5a53aac: Mounted from library/ubuntu
2c6ac8e5063e: Mounted from library/ubuntu
cc967c529ced: Mounted from library/ubuntu
11.2.0: digest: sha256:b61e7341339dee0dc2b9ab833046151de5add94fcb49979d2a9aa33df8a33f84 size: 1578
++ rm -rf /tmp/jmnote-docker-images
```
