FROM debian:bookworm

RUN apt-get update -y && apt-get install -y nginx  \
    && apt-get install -y openssl \
    && openssl req -x509 -sha256 -nodes -newkey rsa:2048 -days 365 \
    -subj "/C=MA/ST=KH/L=KH/O=Organization/CN=localhost" \
    -keyout /etc/ssl/private/localhost.key -out /etc/ssl/certs/localhost.crt

COPY ./conf/default /etc/nginx/sites-available/default

COPY ./tools/index.html /var/www/html/index.html

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]