FROM debian:bookworm

RUN apt-get update && apt-get install -y wget   \
    && apt-get install -y php7.3 php-fpm php-mysql mariadb-client \
    && apt-get clean \
    && wget https://wordpress.org/wordpress-6.0.tar.gz -P /var/www/ \
    && cd /var/www && tar -xzf wordpress-6.0.tar.gz \
    && rm -rf wordpress-6.0.tar.gz \
    && chown -R root:root wordpress 

COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/init.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/init.sh

EXPOSE 9000

CMD ["/usr/local/bin/init.sh"]


