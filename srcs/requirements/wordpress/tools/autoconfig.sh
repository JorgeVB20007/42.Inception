#!/bin/bash

mkdir -p /var/www/html

cd /var/www/html

rm -rf *

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 

chmod +x wp-cli.phar 

cp wp-cli.phar /usr/local/bin/wp

wp core download --allow-root

mv /wp-config.php /var/www/html/wp-config.php

#! Version for VM
wp core install --url="jvacaris.42.fr"/ --title="Hey look, a title" --admin_user=$WP_ADMIN_NAME --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_NAME@student.42madrid.com --skip-email --allow-root
#! Versiion for Mac
#wp core install --url="localhost"/ --title="Hey look, a title" --admin_user=$WP_ADMIN_NAME --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_NAME@student.42madrid.com --skip-email --allow-root

wp user create $WP_PEASANT_NAME $WP_PEASANT_NAME@student.42madrid.com --role=author --user_pass=$WP_PEASANT_PASSWORD --allow-root

wp theme install astra --activate --allow-root

mkdir /run/php

/usr/sbin/php-fpm7.3 -F -R
