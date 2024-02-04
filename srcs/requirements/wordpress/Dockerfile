FROM debian:bookworm

RUN apt-get update && apt-get install -y wget   \
    && apt-get install -y php7.3 php-fpm php-mysql mariadb-client \
    && apt-get clean \
    && wget https://wordpress.org/wordpress-6.0.tar.gz -P /var/www/ \
    && tar -xzf /var/www/wordpress-6.0.tar.gz \
    && rm -rf /var/www/wordpress-6.0.tar.gz \
    # && chown -R root:root /var/www/wordpress

COPY ./tools/init.sh /var/init.sh

EXPOSE 9000

CMD ["sh", "/var/init.sh"]

