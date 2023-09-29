CREATE DATABASE IF NOT EXISTS `$MYSQL_SERVER_NAME`;
CREATE USER IF NOT EXISTS `$MYSQL_USER`@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON `$MYSQL_SERVER_NAME`.* TO `$MYSQL_USER`@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
FLUSH PRIVILEGES;

CREATE DATABASE IF NOT EXISTS $db_name ;
CREATE USER IF NOT EXISTS '$db_user'@'%' IDENTIFIED BY '$db_pwd' ;
GRANT ALL PRIVILEGES ON $db_name.* TO '$db_user'@'%' ;
ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ;
FLUSH PRIVILEGES;