#!/bin/bash

pwd;

sleep 10;

wp config create	--allow-root \
					--dbname=$SQL_DATABASE \
					--dbuser=$SQL_USER \
					--dbpass=$SQL_PASSWORD \
					--dbhost=mariadb:3306 --path='/var/www/wordpress';

wp core install		--title=Example \
					--admin_user=$SQL_USER \
					--admin_password=$SQL_PASSWORD \
					--admin_email=info@example.com;

wp user create bob bob@example.com --role=author;

exec /usr/sbin/php-fpm7.3 -F