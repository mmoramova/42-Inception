FROM debian:bullseye

RUN apt -y update && apt install -y php-fpm && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/php
#RUN chmod 755 /run/php

COPY --chmod=755 ./tools/index.php /var/www/html/index.php
COPY --chmod=755 ./tools/index.php /var/www/html/welcome.php

COPY --chmod=755 ./conf/default.conf /etc/php/7.4/fpm/pool.d/www.conf

EXPOSE 9000

CMD ["php-fpm7.4", "-F"]

#COPY ./tools/init.sh /bin/init.sh
#RUN chmod 777 /bin/init.sh
#CMD ["/bin/init.sh"]