FROM alpine:3.7

COPY prep-server/ /home/prep-server/

RUN \
    apk update \
    apk add bash \
    apk add git \
    apk add vim \ 
    apk add screen \
    apk add openjdk8 \
    apk upgrade

EXPOSE 25565

ENTRYPOINT /home/prep-server/prep-server.sh && /bin/bash
