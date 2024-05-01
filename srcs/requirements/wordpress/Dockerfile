FROM    debian:bullseye

RUN apt update && apt install -y  php php-fpm php-curl php-mysql curl unzip

RUN mkdir -p /run/php/

COPY ./tools/Script.sh /tmp/Script.sh
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf 
RUN chmod +x /tmp/Script.sh

ENTRYPOINT [ "/tmp/Script.sh" ]

CMD ["php-fpm7.4", "-F"]