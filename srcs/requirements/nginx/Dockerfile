FROM debian:bookworm

RUN apt-get update && apt-get install -y nginx

COPY ./conf/default /etc/nginx/sites-available/default

COPY ./tools/index.html /var/www/html/index.html

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]