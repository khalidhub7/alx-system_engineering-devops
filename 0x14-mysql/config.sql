-- config: configure mysql data
-- according in project tasks


CREATE USER holberton_user@localhost IDENTIFIED BY "projectcorrection280hbtn";
GRANT REPLICATION CLIENT ON *.* TO 'holberton_user'@'localhost';
CREATE DATABASE tyrell_corp;
USE tyrell_corp;
CREATE TABLE nexus6(id INTEGER, name TEXT);
INSERT INTO nexus6 VALUES (0, "Jarvis");
GRANT SELECT ON tyrell_corp.nexus6 TO holberton_user@localhost;
CREATE USER replica_user@'%' IDENTIFIED BY "0000";
GRANT REPLICATION SLAVE ON *.* TO 'replica_user'@'%';
GRANT SELECT ON mysql.user TO holberton_user@localhost;
CREATE USER web02@54.90.56.60 IDENTIFIED BY "web02";
GRANT REPLICATION SLAVE ON *.* TO web02@54.90.56.60;
