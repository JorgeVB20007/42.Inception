#!/bin/bash


if test ! -f MYSQL_INSTALLED; then
	echo Installing...
	service mysql start;
	
	echo "CREATE DATABASE IF NOT EXISTS $MYSQL_SERVER_NAME ;" > db1.sql
	echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' ;" >> db1.sql
	echo "GRANT ALL PRIVILEGES ON $MYSQL_SERVER_NAME.* TO '$MYSQL_USER'@'%' ;" >> db1.sql
	echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '"$MYSQL_ROOT_PASSWORD"' ;" >> db1.sql
	echo "FLUSH PRIVILEGES;" >> db1.sql
	
	mysql < db1.sql
	
	kill $(cat /var/run/mysqld/mysqld.pid)
fi

touch MYSQL_INSTALLED
chmod 444 MYSQL_INSTALLED

mysqld
