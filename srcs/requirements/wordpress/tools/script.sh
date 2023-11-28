#!/bin/bash
wp core download --path=/var/www/html --allow-root

rm -rf /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

wp config create --dbname=$MYSQL_DATABASE \
                --dbuser=$MYSQL_USER \
                --dbpass=$MYSQL_PASSWORD \
                --dbhost=$HOST\
                --skip-check \
                --path=/var/www/html/ \
                --allow-root \
                --extra-php<<PHP
define('WP_CACHE', true);
define('WP_REDIS_HOST', 'redis');
define( 'WP_REDIS_PORT', 6379 );
define( 'WP_REDIS_TIMEOUT', 1 );
define( 'WP_REDIS_READ_TIMEOUT', 1 );
define( 'WP_REDIS_DATABASE', 0 );
PHP

wp core install --url=$DOMAIN_NAME \
                --title="Inception" \
                --admin_name=onouakch \
                --admin_password=onouakch_pass \
                --admin_email=onouakch@student.1337.ma \
                --path=/var/www/html/ \
                --allow-root

wp user create onouakch \
                onouakch@student.1337.ma \
                --role=author \
                --user_pass=onouakch_pass \
                --allow-root \
                --path=/var/www/html/

service php-fpm start

wp plugin install redis-cache --path=/var/www/html --activate --allow-root

wp redis enable --path=/var/www/html/ --allow-root

service php-fpm stop

chown -R www-data:www-data -f /var/www/html

php-fpm8.2 -F