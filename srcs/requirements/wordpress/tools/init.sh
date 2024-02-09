#!/bin/bash

sleep 10;

cd /var/www/wordpress

wp config create	--allow-root \
					--dbname=$SQL_DATABASE \
					--dbuser=$SQL_USER \
					--dbpass=$SQL_PASSWORD \
					--dbhost=mariadb:3306 \
					--path='/var/www/wordpress'

wp core install		--allow-root \
					--title=$TITLE \
					--admin_user=$USER1 \
					--admin_password=$SQL_PASSWORD \
					--admin_email=$USER1_MAIL \
					--url=localhost	\
					--path='/var/www/wordpress' \

wp user create $USER2 $USER2_MAIL --allow-root --role=author --user_pass=$SQL_PASSWORD

exec /usr/sbin/php-fpm8.2 -F