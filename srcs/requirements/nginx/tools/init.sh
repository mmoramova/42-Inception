#!/bin/bash
sed -e "s|{SSL_CRT}|${SSL_CRT}|g" \
    -e "s|{SSL_KEY}|${SSL_KEY}|g" \
    -e "s|{DOMAIN_NAME}|${DOMAIN_NAME}|g" \
    /etc/nginx/sites-available/.default > /etc/nginx/sites-available/default

if [ ! -f ${SSL_CRT} ];
then
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout ${SSL_KEY} \
    -out ${SSL_CRT} \
    -subj "/C=ES/ST=Barcelona/L=Barcelona/O=42 Barcelona/CN=${DOMAIN_NAME}";
fi

exec "$@"