FROM alpine:3.7
LABEL Kyle P. <projectinitiativedev@gmail.com>


RUN apk update &&\
    apk add bash &&\
    apk add gawk && \
    apk add curl && \
    apk add git &&\
    apk add vim &&\ 
    apk add screen &&\
    apk add openjdk8 &&\
    apk upgrade;

COPY prep-server/scripts /opt/server/bin

ENV PATH="/opt/server/bin:${PATH}"

RUN chmod +x /opt/server/bin/* &&\
    dos2unix /opt/server/bin/*;

EXPOSE 25565

ENTRYPOINT ["prep-server"]
# ENTRYPOINT ["/home/prep-server/prep-server.sh"]