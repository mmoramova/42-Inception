FROM debian:bullseye

RUN apt -y update && apt install -y vsftpd && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 21

RUN mkdir -p /run/vsftpd/empty
RUN chmod 755 /run/vsftpd/empty

COPY --chmod=755 ./conf/default.conf /etc/vsftpd.conf
COPY --chmod=755 ./tools/init.sh /usr/local/bin/ftp_init.sh

ENTRYPOINT ["/usr/local/bin/ftp_init.sh"]

CMD ["vsftpd", "/etc/vsftpd.conf"]