From debian:buster

RUN apt-get -y update && apt-get -y install mariadb-server -y

EXPOSE 3306

COPY ./tools/init.sh /tmp/init.sh

RUN chmod +x /tmp/init.sh

CMD [ "/tmp/init.sh" ]