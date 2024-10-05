FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y php7.4 php7.4-mysqli curl && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html

RUN curl -L -O https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php && \
    mv adminer-4.8.1.php adminer.php

EXPOSE 8080

CMD ["php", "-S", "0.0.0.0:8080", "/var/www/html/adminer.php"]
