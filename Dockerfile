FROM alpine:3.7
LABEL Kyle P. <projectinitiativedev@gmail.com>

WORKDIR /opt/server/bin

RUN apk update &&\
    apk add util-linux &&\
    apk add bash &&\
    apk add gawk && \
    apk add curl && \
    apk add jq &&\
    apk add tar &&\
    apk add screen &&\
    apk add openjdk8 &&\
    apk add git &&\
    apk add vim &&\ 
    apk upgrade;

COPY prep-server/scripts .
RUN chmod +x ./* &&\
    dos2unix ./*;
ENV PATH="/opt/server/bin:${PATH}"

EXPOSE 25565

ENTRYPOINT ["prep-server"]