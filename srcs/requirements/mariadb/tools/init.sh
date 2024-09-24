#! /bin/bash
service mysql start
sleep 5

if [ ! -d /var/lib/mysql/${SQL_DB} ];
then
    mysql_install_db --user=mysql --ldata=/var/lib/mysql

    mysqld_safe --datadir='/var/lib/mysql' &
    sleep 5

    sed -e "s|{SQL_ROOT_PASSWORD}|${SQL_ROOT_PASSWORD}|g" \
        -e "s|{SQL_DB}|${SQL_DB}|g" \
        -e "s|{SQL_USER}|${SQL_USER}|g" \
        -e "s|{SQL_PASSWORD}|${SQL_PASSWORD}|g" \
        /usr/local/bin/db_init.sql > /usr/local/bin/db_init_s.sql

    mysql -u ${SQL_ROOT_USER} -p${SQL_ROOT_PASSWORD} < /usr/local/bin/db_init_s.sql

    mysqladmin -u ${SQL_ROOT_USER} --password=${SQL_ROOT_PASSWORD} shutdown
fi

exec mysqld

