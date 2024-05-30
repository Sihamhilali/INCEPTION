FROM debian:bullseye

RUN apt-get update && apt-get install -y nginx openssl && apt-get clean

COPY conf/nginx.conf /etc/nginx/sites-available/default

RUN mkdir -p /etc/nginx/ssl

RUN   openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/selhilal.key -out /etc/nginx/ssl/selhilal.crt -subj "/C=MA/ST=CASABLANCA/L=casa/O=42/CN=selhilal.42.fr/UID=selhilal"

COPY tools/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh 

CMD ["bash", "entrypoint.sh"]
