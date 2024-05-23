
#!/bin/bash

if [ -z "$MYSQL_DATABASE" ]; then
  echo "Error: MYSQL_DATABASE is not set."
  exit 1
fi

if [ -z "$MYSQL_ROOT_PASSWORD" ]; then
  echo "Error: MYSQL_ROOT_PASSWORD is not set."
  exit 1
fi

if [ -z "$MYSQL_USER" ]; then
  echo "Error: MYSQL_USER is not set."
  exit 1
fi

if [ -z "$MYSQL_PASSWORD" ]; then
  echo "Error: MYSQL_PASSWORD is not set."
  exit 1
fi

service mariadb start
sleep 5
sed -i 's/bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
mariadb -uroot -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"
mariadb -uroot -e "CREATE USER IF NOT EXISTS ${MYSQL_USER}@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mariadb -uroot -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* to ${MYSQL_USER}@'%'
WITH GRANT OPTION;"
mariadb -uroot -e "FLUSH PRIVILEGES;"
#mariadb -uroot -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"

service mariadb stop
mariadbd