FROM  debian:bullseye

RUN apt update && apt -y install mariadb-server && apt -y install mariadb-client && apt clean

COPY    ./tools/Script.sh .
RUN     chmod +x Script.sh

ENTRYPOINT ["sh","./Script.sh"]
