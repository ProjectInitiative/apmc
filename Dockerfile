FROM alpine:3.7
LABEL Kyle P. <projectinitiativedev@gmail.com>

COPY prep-server/scripts /opt/server/bin

ENV PATH="/opt/server/bin:${PATH}"

RUN apk update &&\
    apk add bash &&\
    apk add gawk && \
    apk add curl && \
    apk add git &&\
    apk add vim &&\ 
    apk add screen &&\
    apk add openjdk8 &&\
    apk upgrade &&\
    chmod +x /opt/server/bin/* &&\
    dos2unix /opt/server/bin/*;
    # echo 'alias start=""' >> ~/.bashrc &&\
    # echo 'alias stop=""' >> ~/.bashrc &&\
    # echo 'alias restart=""' >> ~/.bashrc &&\
    # echo 'alias update=""' >> ~/.bashrc &&\
    # find /opt/server/bin -type f -exec chmod +x {} \;

EXPOSE 25565

ENTRYPOINT ["prep-server"]
# ENTRYPOINT ["/home/prep-server/prep-server.sh"]