#!/bin/bash

sleep 10 

if [ ! -f ./wp-config.php ];
then
    wp core download --path=/var/www/html --allow-root
    wp config create --dbname="${SQL_DB}" --dbuser="${SQL_USER}" --dbpass="${SQL_PASSWORD}" --dbhost="${SQL_HOSTNAME}" --path=/var/www/html --allow-root
    wp core install --url="${DOMAIN_NAME}"  --title="${WP_TITLE}" --admin_user="${WP_ADM_USER}" --admin_password="${WP_ADM_PASSWORD}" --admin_email="${WP_ADM_EMAIL}" --path=/var/www/html --allow-root
    wp user create "${WP_USER}" "${WP_USER_EMAIL}" --role=author --user_pass="${WP_USER_PASSWORD}" --path=/var/www/html --allow-root
    wp theme install kale --activate --path=/var/www/html --allow-root
fi

exec "$@"