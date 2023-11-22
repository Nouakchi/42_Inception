FROM debian:buster

RUN apt-get -y update && apt-get -y install nginx dumb-init; \
    apt-get -y install openssl; \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/onouakch.key \
    -out /etc/ssl/certs/onouakch.crt \
    -subj "/C=MA/ST=Khouribga/L=Khouribga/O=Inception/OU=IT/CN=localhost/emailAddress=onouakch@student.1337.ma";

COPY ./conf/nginx.conf ./etc/nginx/sites-available/

EXPOSE 443

ENTRYPOINT ["/usr/bin/dumb-init", "/usr/sbin/nginx"]

CMD ["-g", "daemon off;"]