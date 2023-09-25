#!/bin/bash
echo "~~~~~~ AUTOCONFIG.SH ~~~~~~"
echo "env working if jvacaris: >>$MYSQL_USER<<"

sleep 10
echo "wp: (1)"

if [ ! -f "/var/www/wordpress/wp-config.php" ]; then
	echo "wp: (2)"
	wp config create --allow-root --dbname=$MYSQL_SERVER_NAME  --dbuser=root  --dbpass=$MYSQL_ROOT_PASSWORD --dbhost=mariadb:3306 --path='/var/www/wordpress'
#	wp config create --allow-root --dbname=jvacaris_db  --dbuser=jvacaris  --dbpass=P455w0rd --dbhost=mariadb:3306 --path='/var/www/wordpress'
	



	
fi

echo "wp: (3)"

if ! wp core is-installed --allow-root --path='/var/www/wordpress'; then
	echo "wp: (4)"
	wp core install --path='/var/www/wordpress' \
	--allow-root \ 
	--url=https://$DOMAIN_NAME \
	--title=administrator \
	--admin_user=$WP_ADMIN_NAME \
	--admin_password=$WP_ADMIN_PASSWORD

	echo "wp: (5)"

	wp user create --path='/var/www/wordpress' \
		--allow-root \
		$WP_PEASANT_NAME \
		--role=author \
		--user_pass=$WP_PEASANT_PASSWORD

fi

echo "wp: (6)"
/usr/sbin/php-fpm7.3 -F
sleep infinity
echo "wp: (7)"