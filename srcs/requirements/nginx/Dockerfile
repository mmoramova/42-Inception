FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y nginx openssl && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 443

COPY --chmod=755 ./conf/default.conf /etc/nginx/sites-available/.default 
COPY --chmod=755 ./tools/init.sh /usr/local/bin/ssl_init.sh

ENTRYPOINT ["/usr/local/bin/ssl_init.sh"]

CMD ["nginx", "-g", "daemon off;"]