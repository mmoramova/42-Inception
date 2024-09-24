FROM debian:bullseye

RUN apt -y update && apt install -y nginx openssl && rm -rf /var/lib/apt/lists/*

COPY ./tools/welcome.html /var/www/html/page.html

EXPOSE 443
EXPOSE 80

COPY --chmod=755 ./conf/default.conf /etc/nginx/sites-available/default 

CMD ["nginx", "-g", "daemon off;"]