FROM debian:bookworm

RUN apt-get update -y && apt-get install -y mariadb-server

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/init.sh /usr/local/bin/init.sh

EXPOSE 3306

CMD ["sh", "/usr/local/bin/init.sh"]