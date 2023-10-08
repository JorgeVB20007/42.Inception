FROM debian:buster

RUN apt-get -y update && apt-get -y upgrade && apt update -y && apt upgrade -y

#RUN apt update -y \
#&& apt upgrade -y \
#&& apt-get install -y php7.3 php7.3-fpm php7.3-mysql mariadb-client

RUN apt-get -y install wget
RUN wget https://wordpress.org/latest.tar.gz -P /var/www
RUN tar -xzvf /var/www/latest.tar.gz -C /var/www
RUN chmod 755 /var/www
RUN rm -f /var/www/latest.tar.gz

#RUN apt-get -y install php
#RUN rm /etc/php/7.3/fpm/pool.d/www.conf
RUN apt install php-fpm php-mysql -y&& apt install curl -y

COPY conf/wp-config.php /wp-config.php
COPY tools/autoconfig.sh /autoconfig.sh
RUN chmod 755 /autoconfig.sh
COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

CMD [ "/autoconfig.sh" ]



#RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

##RUN chmod +x wp-cli.phar
#RUN mv wp-cli.phar /usr/local/bin/wp

#COPY tools/autoconfig.sh /var/www/wordpress/autoconfig.sh
#RUN chmod 755 /var/www/wordpress/autoconfig.sh

# ENTRYPOINT [ "/var/www/wordpress/autoconfig.sh" ]
#CMD [ "bash" , "/var/www/wordpress/autoconfig.sh" ]

