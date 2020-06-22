FROM alpine:3.11.5 as dockerize

WORKDIR /workdir

RUN apk add --no-cache openssl

ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
  && tar -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
  && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz

FROM node:10.15.3

ENV WORKDIR=/workdir
WORKDIR $WORKDIR

COPY --from=dockerize /workdir/dockerize /usr/local/bin/

USER node
