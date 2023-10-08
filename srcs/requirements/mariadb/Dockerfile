FROM debian:buster

RUN apt update -y && \
    apt install mariadb-server -y


COPY conf/mariadb2.conf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/createdb.sh createdb.sh
RUN chmod 755 createdb.sh


CMD [ "bash" , "/createdb.sh" ]








