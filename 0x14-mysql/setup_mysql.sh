#!/usr/bin/env bash
# install mysql in (web_01, web_02)
# (web_01) is salve
# (web_02) is replica

# 1- Clean Running MySQL Processes
sudo ps aux | grep mysql
sudo service mysql stop


# 2- Remove Existing MySQL Versions
sudo apt-get remove --purge mysql-server mysql-client mysql-common -y && sudo apt-get autoremove -y
sudo rm -rf /etc/apt/sources.list.d/mysql.list*
sudo rm -rf /var/lib/mysql-apt-config
sudo dpkg --purge mysql-apt-config
dpkg -l | grep mysql
sudo rm -rf /etc/mysql /var/lib/mysql
sudo apt clean


# 3- now install mysql
: '
select ubuntu bionic && select mysql-5.7 OK again select mysql-5.7
return and select ok && set password
'
sudo dpkg --configure -a
sudo wget -O mysql57 https://raw.githubusercontent.com/nuuxcode/alx-system_engineering-devops/master/scripts/mysql57
sudo chmod +x mysql57 && sudo ./mysql57
mysql --version
sudo service mysql restart
sudo service mysql status


# 4- config database
: 'task 1'
sudo mysql -u root -p
CREATE USER 'holberton_user'@'localhost' IDENTIFIED BY 'projectcorrection280hbtn';
GRANT REPLICATION CLIENT ON *.* TO 'holberton_user'@'localhost';
FLUSH PRIVILEGES;

: 'task 2'
CREATE DATABASE tyrell_corp;
USE tyrell_corp;
CREATE TABLE nexus6 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255)
);
INSERT INTO nexus6 (name) VALUES ('KHALID');
GRANT SELECT ON tyrell_corp.* TO 'holberton_user'@'localhost';
FLUSH PRIVILEGES;

: 'task 3'
CREATE USER 'replica_user'@'%' IDENTIFIED BY '0000';
GRANT REPLICATION SLAVE ON *.* TO 'replica_user'@'%';
GRANT SELECT ON mysql.user TO 'holberton_user'@'localhost';
FLUSH PRIVILEGES;


# 5- config salve and replica
: 'task 4
Configure MySQL on the Primary Server (web-01)'
# web_01
cp /etc/mysql/mysql.conf.d/mysqld.cnf ~/backups/mysqld.cnf
sudo vi /etc/mysql/mysql.conf.d/mysqld.cnf
sudo tee /etc/mysql/mysql.conf.d/mysqld.cnf > /dev/null <<EOF
# default text
[mysqld]
pid-file        = /var/run/mysqld/mysqld.pid
socket          = /var/run/mysqld/mysqld.sock
datadir         = /var/lib/mysql
log-error       = /var/log/mysql/error.log
symbolic-links=0

# append this to config slave
symbolic-links  = 0
server-id = 1
log_bin = /var/log/mysql/mysql-bin.log
binlog_do_db = tyrell_corp
# bind-address    = 127.0.0.1 comment this
EOF

sudo systemctl restart mysql
mysql -u root -p -e "SHOW MASTER STATUS;"


# web_02
cp /etc/mysql/mysql.conf.d/mysqld.cnf ~/backups/mysqld.cnf
sudo vi /etc/mysql/mysql.conf.d/mysqld.cnf
sudo tee /etc/mysql/mysql.conf.d/mysqld.cnf > /dev/null <<EOF
# default text
[mysqld]
pid-file        = /var/run/mysqld/mysqld.pid
socket          = /var/run/mysqld/mysqld.sock
datadir         = /var/lib/mysql
log-error       = /var/log/mysql/error.log

# append this to config replica
server-id = 2
relay-log = /var/log/mysql/mysql-relay-bin.log
# bind-address    = 127.0.0.1 comment this
symbolic-links  = 0
log_bin         = /var/log/mysql/mysql-bin.log
binlog_do_db    = tyrell_corp
EOF
sudo systemctl restart mysql


mysql -u root -p
STOP SLAVE;
RESET SLAVE;
CHANGE MASTER TO
    MASTER_HOST='34.203.38.10',
    MASTER_USER='replica_user',
    MASTER_PASSWORD='0000',
    MASTER_LOG_FILE='mysql-bin.000003',
    MASTER_LOG_POS=154;

START SLAVE;

# verify
mysql -u root -p -e "SHOW SLAVE STATUS\G"






# for debugging if any issues
# all sql code
sudo mysql -u root -p
CREATE USER 'holberton_user'@'localhost' IDENTIFIED BY 'projectcorrection280hbtn';
GRANT REPLICATION CLIENT ON *.* TO 'holberton_user'@'localhost';
CREATE DATABASE tyrell_corp;
USE tyrell_corp;
CREATE TABLE nexus6 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255)
);
INSERT INTO nexus6 (name) VALUES ('KHALID');
GRANT SELECT ON tyrell_corp.* TO 'holberton_user'@'localhost';
CREATE USER 'replica_user'@'%' IDENTIFIED BY '0000';
GRANT REPLICATION SLAVE ON *.* TO 'replica_user'@'%';
GRANT SELECT ON mysql.user TO 'holberton_user'@'localhost';
FLUSH PRIVILEGES;

# to undo all sql code
DROP USER IF EXISTS 'holberton_user'@'localhost';
DROP DATABASE IF EXISTS tyrell_corp;
DROP USER IF EXISTS 'replica_user'@'%';
FLUSH PRIVILEGES;
