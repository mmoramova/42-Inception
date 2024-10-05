FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    pip3 install pelican markdown && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /app/my-site && chmod 755 /app/my-site

WORKDIR /app/my-site

COPY ./my-site /app/my-site/

RUN pelican content

EXPOSE 5000

CMD ["pelican", "content", "-l", "-p", "5000", "-b", "0.0.0.0", "-o", "output", "-s", "pelicanconf.py"]
