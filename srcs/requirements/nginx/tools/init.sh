#!/bin/bash

sed -i "s/localhost/$DOMAINE_NAME/g" /etc/nginx/sites-available/default;

sed -i "s|certpath|$CERTS|g" /etc/nginx/sites-available/default;

sed -i "s|keypath|$KEYS|g" /etc/nginx/sites-available/default;

mv /etc/ssl/private/localhost.key $KEYS$DOMAINE_NAME.key;

mv /etc/ssl/certs/localhost.crt $CERTS$DOMAINE_NAME.crt;

exec nginx -g "daemon off;";
