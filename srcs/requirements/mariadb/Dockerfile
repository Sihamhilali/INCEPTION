FROM  debian:bullseye

ENV MYSQL_DATABASE=${MYSQL_DATABASE}
ENV MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}
ENV MYSQL_USER=${MYSQL_USER}
ENV MYSQL_PASSWORD=${MYSQL_PASSWORD}

RUN apt update && apt -y install mariadb-server && apt -y install mariadb-client && apt clean

COPY    ./tools/Script.sh .
RUN     chmod +x Script.sh

EXPOSE  3306

ENTRYPOINT ["sh","./Script.sh"]
