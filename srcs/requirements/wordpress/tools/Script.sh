#!/bin/bash
cd /var/www/html
wp core download --allow-root
wp config create --allow-root --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb
wp core install --url=$DOMAIN_NAME --title=Inception --admin_user=supervisor --admin_password=strongpassword --admin_email=info@example.com --allow-root
service php7.4-fpm start
sed -i "s/^listen = .*/listen = 0.0.0.0:9000/" /etc/php/7.4/fpm/pool.d/www.conf
service php7.4-fpm stop

php-fpm7.4 -F