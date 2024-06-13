FROM debian:bullseye

RUN apt update && apt install -y  php php-fpm php-curl php-mysql curl 
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN mkdir -p /run/php/

COPY ./tools/Script.sh /tmp/Script.sh


RUN chmod +x /tmp/Script.sh

ENTRYPOINT [ "sh", "/tmp/Script.sh" ]