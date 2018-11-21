FROM docker.io/project31/aarch64-alpine-qemu:3.5-7
RUN [ "cross-build-start" ]
# FROM alpine:3.5

LABEL maintainer "Sebastian Daehne <daehne@rshc.de>"

# update and add dependencies
RUN apk update && apk upgrade && \
    apk add tzdata curl wget bash ruby ruby-dev g++ musl-dev make nodejs && \
    rm -rf /var/cache/apk/*

RUN echo "gem: --no-document" > /etc/gemrc 

# install smashing
RUN gem install bundler smashing io-console json thin

# dashboard
RUN smashing new dashboard

ENV PORT 3030
EXPOSE ${PORT}
WORKDIR /dashboard

ADD run.sh /

CMD ["/bin/sh", "/run.sh"]

RUN [ "cross-build-end" ]
