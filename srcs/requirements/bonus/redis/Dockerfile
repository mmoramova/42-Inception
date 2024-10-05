FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y redis-server && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 6379

COPY --chmod=755 ./conf/default.conf /etc/redis/redis.conf

CMD ["redis-server", "--protected-mode", "no"]