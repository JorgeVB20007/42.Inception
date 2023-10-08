#!/bin/bash
echo "~~~~~~ CREATEDB.SH ~~~~~~"
echo "Working if jvacaris: >>$MYSQL_USER<<"
echo "Working if P455w0rd_r00t: >>$MYSQL_ROOT_PASSWORD<<"
echo "Working if P455w0rd: >>$MYSQL_PASSWORD<<"
echo "Working if jvacaris_db: >>$MYSQL_SERVER_NAME<<"
echo "db: (1)"

#echo go to sleep...
#sleep infinity

if test ! -f MYSQL_INSTALLED; then
	echo Installing...
	service mysql start;
	echo "db: (2)"
	echo "CREATE DATABASE IF NOT EXISTS $MYSQL_SERVER_NAME ;" > db1.sql
	echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' ;" >> db1.sql
	echo "GRANT ALL PRIVILEGES ON $MYSQL_SERVER_NAME.* TO '$MYSQL_USER'@'%' ;" >> db1.sql
	echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '"$MYSQL_ROOT_PASSWORD"' ;" >> db1.sql
	echo "FLUSH PRIVILEGES;" >> db1.sql
	echo "db: (3)"
	mysql < db1.sql
	echo "db: (4)"
	kill $(cat /var/run/mysqld/mysqld.pid)
fi

touch MYSQL_INSTALLED
chmod 444 MYSQL_INSTALLED
echo "~~~~~"
ls /var/run/mysqld
echo "~~~~~"

echo "db: (5)"
echo Installed...
mysqld
echo "db: (6)"

