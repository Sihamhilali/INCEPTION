#!/bin/bash
sleep 15

if [ -f /var/www/html/wp-config.php ]; then
    echo "WordPress already installed"
else
    mkdir -p /var/www/html
    cd /var/www/html

    if [ ! -f /usr/local/bin/wp ]; then
        curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
        chmod +x wp-cli.phar
        mv wp-cli.phar /usr/local/bin/wp
        echo "Downloaded wp-cli"
    fi
    wp core download --allow-root 2>/dev/null
    wp config create --allow-root --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb 2>/dev/null
    wp core install --url=$DOMAIN_NAME --title=Inception --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASS --admin_email=$ADMIN_EMAIL --allow-root 2>/dev/null
    wp user create $USER_NAME $EMAIL_PRS --role=subscriber --user_pass=$USER_PASS --allow-root 2>/dev/null
    service php7.4-fpm stop
fi
sed -i "s/^listen = .*/listen = 0.0.0.0:9000/" /etc/php/7.4/fpm/pool.d/www.conf 2>/dev/null
echo "Starting php-fpm"
php-fpm7.4 -F -R