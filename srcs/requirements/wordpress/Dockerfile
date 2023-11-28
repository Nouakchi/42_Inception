FROM debian:bookworm

RUN apt-get -y update && apt-get -y install curl; \
    apt-get install -y php-fpm8.2 php-mysql8.2; \
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar; \
    chmod +x wp-cli.phar; \
    mv wp-cli.phar /usr/local/bin/wp;

EXPOSE 9000

COPY ./tools/script.sh ./

COPY ./conf/www.conf ./etc/php/8.2/fpm/pool.d/

RUN chmod +x script.sh

ENTRYPOINT ["/usr/bin/dumb-init"]

CMD ["./script.sh"]