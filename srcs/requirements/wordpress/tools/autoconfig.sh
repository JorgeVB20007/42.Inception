#!/bin/bash

# create directory to use in nginx container later and also to setup the wordpress conf
echo "wp: (1)"
mkdir /var/www/
mkdir /var/www/html
echo "wp: (2)"

cd /var/www/html

echo "wp: (3)"
# remove all the wordpress files if there is something from the volumes to install it again
rm -rf *

echo "wp: (4)"
# The commands are for installing and using the WP-CLI tool.

# downloads the WP-CLI PHAR (PHP Archive) file from the GitHub repository. The -O flag tells curl to save the file with the same name as it has on the server.
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 

echo "wp: (5)"
# makes the WP-CLI PHAR file executable.
chmod +x wp-cli.phar 
echo "wp: (6)"

# moves the WP-CLI PHAR file to the /usr/local/bin directory, which is in the system's PATH, and renames it to wp. This allows you to run the wp command from any directory
cp wp-cli.phar /usr/local/bin/wp
echo "wp: (7)"

# downloads the latest version of WordPress to the current directory. The --allow-root flag allows the command to be run as the root user, which is necessary if you are logged in as the root user or if you are using WP-CLI with a system-level installation of WordPress.
wp core download --allow-root
echo "wp: (8)"

#mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
mv /wp-config.php /var/www/html/wp-config.php
echo "wp: (9)"

# change the those lines in wp-config.php file to connect with database

#line 23
sed -i -r "s/database/$MYSQL_SERVER_NAME/1"   wp-config.php
#line 26
sed -i -r "s/database_user/$MYSQL_USER/1"  wp-config.php
#line 29
sed -i -r "s/passwod/$MYSQL_PASSWORD/1"    wp-config.php
echo "wp: (10)"

#line 32
sed -i -r "s/localhost/mariadb/1"    wp-config.php  #(to connect with mariadb database)
echo "wp: (11)"

# installs WordPress and sets up the basic configuration for the site. The --url option specifies the URL of the site, --title sets the site's title, --admin_user and --admin_password set the username and password for the site's administrator account, and --admin_email sets the email address for the administrator. The --skip-email flag prevents WP-CLI from sending an email to the administrator with the login details.
wp core install --url="jvacaris.42.fr"/ --title="Hey look, a title" --admin_user=$WP_ADMIN_NAME --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_NAME@student.42madrid.com --skip-email --allow-root
echo "wp: (12)"

# creates a new user account with the specified username, email address, and password. The --role option sets the user's role to author, which gives the user the ability to publish and manage their own posts.
wp user create $WP_PEASANT_NAME $WP_PEASANT_NAME@student.42madrid.com --role=author --user_pass=$WP_PEASANT_PASSWORD --allow-root
echo "wp: (13)"

# installs the Astra theme and activates it for the site. The --activate flag tells WP-CLI to make the theme the active theme for the site.
wp theme install astra --activate --allow-root
echo "wp: (14)"


wp plugin install redis-cache --activate --allow-root
echo "wp: (15)"


# uses the sed command to modify the www.conf file in the /etc/php/7.3/fpm/pool.d directory. The s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g command substitutes the value 9000 for /run/php/php7.3-fpm.sock throughout the file. This changes the socket that PHP-FPM listens on from a Unix domain socket to a TCP port.
sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf
echo "wp: (16)"

# creates the /run/php directory, which is used by PHP-FPM to store Unix domain sockets.
mkdir /run/php
echo "wp: (17)"


#wp redis enable --allow-root
echo "wp: (18)"


# starts the PHP-FPM service in the foreground. The -F flag tells PHP-FPM to run in the foreground, rather than as a daemon in the background.
/usr/sbin/php-fpm7.3 -F
echo "wp: (19)"