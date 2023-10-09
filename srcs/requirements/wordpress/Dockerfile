FROM debian:buster

RUN apt-get -y update && apt-get -y upgrade && apt update -y && apt upgrade -y

RUN apt-get -y install wget
RUN wget https://wordpress.org/latest.tar.gz -P /var/www
RUN tar -xzvf /var/www/latest.tar.gz -C /var/www
RUN chmod 755 /var/www
RUN rm -f /var/www/latest.tar.gz

RUN apt install php-fpm php-mysql -y&& apt install curl -y

COPY conf/wp-config.php /wp-config.php
COPY tools/autoconfig.sh /autoconfig.sh
RUN chmod 755 /autoconfig.sh
COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

CMD [ "/autoconfig.sh" ]
