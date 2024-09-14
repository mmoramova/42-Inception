FROM debian:bullseye

RUN apt -y update && apt install -y nginx openssl
COPY ./tools/welcome.html /var/www/html/page.html
#rm -rf /var/lib/apt/lists/*

EXPOSE 443
EXPOSE 80

COPY ./conf/default.conf /etc/nginx/sites-available/default 

#ENTRYPOINT ["/usr/sbin/nginx"]
#CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
CMD ["nginx", "-g", "daemon off;"]