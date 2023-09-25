#!/bin/bash
echo "~~~~~~ CREATEDB.SH ~~~~~~"
echo "Working if jvacaris: >>$MYSQL_USER<<"

mysql_install_db --user=root --password=$MYSQL_ROOT_PASSWORD
# mysql_upgrade --user=root --password=$MYSQL_ROOT_PASSWORD
service mariadb start
echo "db: (1)"
mysql -e "CREATE DATABASE IF NOT EXISTS \`$MYSQL_SERVER_NAME\`;"
echo "db: (2)"
mysql -e "CREATE USER IF NOT EXISTS \`$MYSQL_USER\`@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';"
echo "db: (3)"
mysql -e "GRANT ALL PRIVILEGES ON \`$MYSQL_SERVER_NAME\`.* TO \`$MYSQL_USER\`@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
echo "db: (4)"
# mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
mysql -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$MYSQL_ROOT_PASSWORD');"
echo "db: (5)"
#echo "> \$MYSQL_ROOT_PASSWORD = $MYSQL_ROOT_PASSWORD"
mysql -u root --password=$MYSQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"
echo "db: (6)"
mysqladmin -uroot -p$MYSQL_ROOT_PASSWORD shutdown
echo "db: (7)"
#service mariadb stop
exec mysqld_safe
echo "db: (8)"