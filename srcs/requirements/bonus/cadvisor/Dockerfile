FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y curl && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /app/cadvisor
RUN chmod 755 /app/cadvisor

WORKDIR /app/cadvisor

RUN curl -L https://github.com/google/cadvisor/releases/download/v0.49.1/cadvisor-v0.49.1-linux-amd64 -o cadvisor;\
chmod +x cadvisor

EXPOSE 6000

CMD ["./cadvisor", "--logtostderr", "--port=6000"]
