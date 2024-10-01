#!/bin/bash

if ! id "${FTP_USER}" &>/dev/null; then
    useradd -m ${FTP_USER}
    echo "${FTP_USER}:${FTP_PASSWORD}" | chpasswd
    usermod -d /var/www/html ${FTP_USER}
    chown -R ${FTP_USER}:${FTP_USER} /var/www/html
fi

exec "$@"