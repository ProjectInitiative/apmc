FROM alpine:3.7
LABEL Kyle P. <projectinitiativedev@gmail.com>

COPY prep-server/ /home/prep-server/

RUN apk update &&\
    apk add bash &&\
    apk add gawk && \
    apk add curl && \
    apk add git &&\
    apk add vim &&\ 
    apk add screen &&\
    apk add openjdk8 &&\
    apk upgrade &&\
    find /home/prep-server/ -type f -iname "*.sh" -exec chmod +x {} \;

EXPOSE 25565

ENTRYPOINT ["/home/prep-server/prep-server.sh"]