#!/bin/bash

pwd;

sleep 10;

cd /var/www/wordpress

wp config create	--allow-root \
					--dbname=$SQL_DATABASE \
					--dbuser=$SQL_USER \
					--dbpass=$SQL_PASSWORD \
					--dbhost=mariadb:3306 \
					--path='/var/www/wordpress'

wp core install		--allow-root \
					--title=Example \
					--admin_user=$SQL_USER \
					--admin_password=$SQL_PASSWORD \
					--admin_email=info@example.com \
					--path='/var/www/wordpress' \
					--url='localhost'

wp user create bob bob@example.com --allow-root --role=author --user_pass=bob_pass

exec /usr/sbin/php-fpm8.2 -F