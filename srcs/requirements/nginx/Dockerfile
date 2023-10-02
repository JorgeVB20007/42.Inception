FROM debian:buster

RUN apt update -y
RUN apt install nginx -y
RUN apt install openssl -y

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/certificate.crt -keyout /etc/nginx/ssl/key.key -subj "/C=ES/ST=Madrid/L=Madrid/O=42Madrid/OU=Learner/CN=jvacaris.42.fr"

RUN chmod 755 /var/www/html
RUN chmod 755 /var/www/html/index.nginx-debian.html
RUN chown -R www-data:www-data /var/www/html

# COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/nginx.conf /etc/nginx/sites-available/default
RUN chmod 755 /etc/nginx/sites-available/default

CMD [ "nginx", "-g", "daemon off;" ]








