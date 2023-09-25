FROM debian:buster

RUN apt update -y \
&& apt upgrade -y \
&& apt-get -y install wget \
&& apt-get install -y php7.3 php7.3-fpm php7.3-mysql mariadb-client

RUN wget https://wordpress.org/wordpress-6.3.tar.gz -P /var/www
RUN tar -xzvf /var/www/wordpress-6.3.tar.gz -C /var/www
RUN chmod 755 /var/www
RUN rm -f /var/www/wordpress-6.3.tar.gz

RUN apt-get -y install php
RUN rm /etc/php/7.3/fpm/pool.d/www.conf


COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf


RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY tools/autoconfig.sh /var/www/wordpress/autoconfig.sh
RUN chmod 755 /var/www/wordpress/autoconfig.sh

# ENTRYPOINT [ "/var/www/wordpress/autoconfig.sh" ]
CMD [ "bash" , "/var/www/wordpress/autoconfig.sh" ]

