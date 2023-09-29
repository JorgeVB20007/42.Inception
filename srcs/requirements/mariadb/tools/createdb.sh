#!/bin/bash
echo "~~~~~~ CREATEDB.SH ~~~~~~"
echo "Working if jvacaris: >>$MYSQL_USER<<"
echo "db: (1)"


if test ! -f MYSQL_INSTALLED; then
export MYSQL_ROOT_PASSWORD=P455w0rd_r00t
export MYSQL_USER=jvacaris
export MYSQL_PASSWORD=P455w0rd
export MYSQL_SERVER_NAME=jvacaris_db
#	mkdir /var/run/mysqld
#	touch /var/run/mysqld/mysqld.sock
	service mysql start;
	echo "db: (2)"
	echo "CREATE DATABASE IF NOT EXISTS $MYSQL_SERVER_NAME ;" > db1.sql
	echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' ;" >> db1.sql
	echo "GRANT ALL PRIVILEGES ON $MYSQL_SERVER_NAME.* TO '$MYSQL_USER'@'%' ;" >> db1.sql
	echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ;" >> db1.sql
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
mysqld
echo "db: (6)"

# mysql_install_db --user=root --password=$MYSQL_ROOT_PASSWORD
# # mysql_upgrade --user=root --password=$MYSQL_ROOT_PASSWORD
# service mariadb start
# echo "db: (1)"
# mysql -e "CREATE DATABASE IF NOT EXISTS \`$MYSQL_SERVER_NAME\`;"
# echo "db: (2)"
# mysql -e "CREATE USER IF NOT EXISTS \`$MYSQL_USER\`@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';"
# echo "db: (3)"
# mysql -e "GRANT ALL PRIVILEGES ON \`$MYSQL_SERVER_NAME\`.* TO \`$MYSQL_USER\`@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
# echo "db: (4)"
# # mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
# mysql -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$MYSQL_ROOT_PASSWORD');"
# echo "db: (5)"
# #echo "> \$MYSQL_ROOT_PASSWORD = $MYSQL_ROOT_PASSWORD"
# mysql -u root --password=$MYSQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"
# echo "db: (6)"
# mysqladmin -uroot -p$MYSQL_ROOT_PASSWORD shutdown
# echo "db: (7)"
# #service mariadb stop
# exec mysqld_safe
# echo "db: (8)"