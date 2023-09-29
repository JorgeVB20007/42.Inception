FROM debian:buster

RUN apt update -y && \
    apt upgrade -y && \
    apt install vim -y && \
    apt install mariadb-server -y

# RUN mkdir /var/run/mysqld && chown -R mysql:mysql /var/run/mysqld

COPY conf/mariadb2.conf	/etc/mysql/mariadb.conf.d/50-server.cnf
#RUN rm -f /etc/mysql/my.cnf
#COPY conf/mariadb.conf	/etc/mysql/my.cnf
#RUN chmod 755 /etc/mysql/my.cnf
COPY tools/createdb.sh createdb.sh
RUN chmod 755 createdb.sh

CMD [ "/createdb.sh" ]

# ENTRYPOINT [ "/createdb.sh" ]
# CMD [ "bash" , "/createdb.sh" ]


# COPY conf/mariadb.conf	/etc/mysql/mariadb.conf

# RUN service mysql start && \
# mysql -e "CREATE DATABASE IF NOT EXISTS \`jvacaris_db\`;" && \
# mysql -e "CREATE USER IF NOT EXISTS \`jvacaris\`@'localhost' IDENTIFIED BY 'P455w0rd';" && \
# mysql -e "GRANT ALL PRIVILEGES ON \`jvacaris_db\`.* TO \`jvacaris\`@'%' IDENTIFIED BY 'P455w0rd';" && \
# mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'P455w0rd_r00t';" && \
# mysql -u root --password=P455w0rd_r00t -e "FLUSH PRIVILEGES;" && \
# mysqladmin -u root --password=P455w0rd_r00t shutdown

# CMD [ "exec" , "mysqld_safe" ]
#CMD [ "service" , "mysql", "start" ]


# RUN service mysql start
# RUN mysql -e "CREATE DATABASE IF NOT EXISTS \`jvacaris_db\`;" && \
# mysql -e "CREATE USER IF NOT EXISTS \`jvacaris\`@'localhost' IDENTIFIED BY 'P455w0rd';" && \
# mysql -e "GRANT ALL PRIVILEGES ON \`jvacaris_db\`.* TO \`jvacaris\`@'%' IDENTIFIED BY 'P455w0rd';" && \
# mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'P455w0rd_r00t';" && \
# mysql -e "FLUSH PRIVILEGES;"




#TODO	RUN mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_SERVER_NAME}\`;"
#RUN mysql -e "CREATE DATABASE IF NOT EXISTS \`jvacaris_db\`;"
#TODO	RUN mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"
#RUN mysql -e "CREATE USER IF NOT EXISTS \`jvacaris\`@'localhost' IDENTIFIED BY 'P455w0rd';"

# RUN mysql tools/create_database.sql






