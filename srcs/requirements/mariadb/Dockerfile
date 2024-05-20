FROM  debian:bullseye

ARG MYSQL_DATABASE
ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_USER
ARG MYSQL_PASSWORD


RUN apt update && apt -y install mariadb-server && apt -y install mariadb-client

# RUN mkdir -p /var/run/mysqld && chown -R mysql /var/run/mysqld && chmod -R 777 /var/run/mysqld && \
#     sed -i "s|bind-address            = 127.0.0.1|bind-address            = 0.0.0.0|g" /etc/mysql/mariadb.conf.d/50-server.cnf
COPY    ./tools/Script.sh .
RUN     chmod +x Script.sh

EXPOSE  3306

ENTRYPOINT ["sh","./Script.sh"]