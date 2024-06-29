-- config: configure mysql data
-- according in project tasks

-- task 1
CREATE USER 'holberton_user'@'localhost' IDENTIFIED BY 'projectcorrection280hbtn';
GRANT REPLICATION CLIENT ON *.* TO 'holberton_user'@'localhost';

-- task 2
CREATE DATABASE tyrell_corp;
USE tyrell_corp;
CREATE TABLE nexus6 (id INTEGER NOT NULL PRIMARY KEY, name TEXT);
INSERT INTO nexus6 VALUES (1, 'Khalid');
GRANT SELECT ON tyrell_corp.nexus6 TO 'holberton_user'@'localhost';

-- task 3
CREATE USER 'replica_user'@'%' IDENTIFIED BY '0000';
GRANT REPLICATION SLAVE ON *.* TO 'replica_user'@'%';
GRANT SELECT ON mysql.user TO 'holberton_user'@'localhost';

FLUSH PRIVILEGES;


-- go to web_02
sudo mysql -u root -p

CHANGE MASTER TO
    MASTER_HOST = '100.27.0.26',
    MASTER_USER = 'replica_user',
    MASTER_PASSWORD = '0000',
    MASTER_LOG_FILE = 'mysql-bin.000011',
    MASTER_LOG_POS = 154;
