# FROM golang:1.7.3 AS builder

# WORKDIR /go/src/github.com/projectinitiative/web-service
# RUN go get -d -v golang.org/x/net/html
# COPY app.go .
# RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .


FROM alpine:3.7
LABEL Kyle P. <projectinitiativedev@gmail.com>

WORKDIR /opt/server/bin

RUN apk update &&\
    apk add bash &&\
    apk add gawk && \
    apk add curl && \
    apk add git &&\
    apk add vim &&\ 
    apk add screen &&\
    apk add openjdk8 &&\
    apk upgrade;

COPY prep-server/scripts .
RUN chmod +x ./* &&\
    dos2unix ./*;
# COPY --from=builder /go/src/github.com/projectinitiative/web-service/app .
ENV PATH="/opt/server/bin:${PATH}"

EXPOSE 25565

ENTRYPOINT ["prep-server"]
# ENTRYPOINT ["/home/prep-server/prep-server.sh"]