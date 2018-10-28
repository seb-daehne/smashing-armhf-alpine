FROM armhf/alpine:3.5
LABEL maintainer "Sebastian Daehne <daehne@rshc.de>"

# update and add dependencies
RUN apk update && apk upgrade && \
    apk add tzdata curl wget bash ruby ruby-dev g++ musl-dev make &&
    rm -rf /var/cache/apk/*

RUN echo "gem: --no-document" > /etc/gemrc 

# install smashing
RUN gem install bundler smashing io-console

# dashboard
RUN smashing new dashboard

ENV PORT 3030
EXPOSE ${SMASHING_PORT}
WORKDIR /dashing

ADD run.sh /

CMD ["/run.sh"]
