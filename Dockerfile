FROM alpine:3.19

WORKDIR /app

COPY src /app

RUN apk add linux-headers build-base

COPY build.sh /build.sh

RUN /build.sh