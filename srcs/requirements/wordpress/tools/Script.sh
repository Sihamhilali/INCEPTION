#!/bin/bash
sleep 15

if [ -f /var/www/html/wp-config.php ]; then
    echo "WordPress already installed"
else
    mkdir -p /var/www/html
    cd /var/www/html

    rm -rf *

    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

    chmod +x wp-cli.phar

    mv wp-cli.phar /usr/local/bin/wp

    wp core download --allow-root
    wp config create --allow-root --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb
    wp core install --url=$DOMAIN_NAME --title=Inception --admin_user=$ADMINE_USER --admin_password=$USER_PASS --admin_email=$EMAIL_PRS --allow-root
    
    sed -i "s/^listen = .*/listen = 0.0.0.0:9000/" /etc/php/7.4/fpm/pool.d/www.conf
    service php7.4-fpm stop
    wp user create newuser $EMAIL_PRS--role=editor --user_pass=$USER_PASS --allow-root
fi

php-fpm7.4 -F