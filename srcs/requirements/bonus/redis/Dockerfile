FROM debian:bullseye

RUN apt -y update && apt install -y redis-server && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 6379

COPY --chmod=755 ./conf/default.conf /etc/redis/redis.conf

CMD ["redis-server", "--protected-mode", "no"]