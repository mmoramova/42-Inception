FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y \
        php7.4-fpm \
        php7.4-mysqli \
        curl \
        mariadb-client \
        php-redis && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 9000

RUN mkdir -p /run/php && chmod 755 /run/php

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

COPY --chmod=755 ./conf/default.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY --chmod=755 ./tools/init.sh /usr/local/bin/wp_init.sh

WORKDIR /var/www/html/

ENTRYPOINT ["/usr/local/bin/wp_init.sh"]

CMD ["php-fpm7.4", "-F"]