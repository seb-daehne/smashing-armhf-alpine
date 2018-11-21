FROM rycus86/armhf-alpine-qemu
ARG ARCH=armhf
#FROM alpine:3.5

LABEL maintainer "Sebastian Daehne <daehne@rshc.de>"

# update and add dependencies
RUN apk update && apk upgrade && \
    apk add tzdata curl wget bash ruby ruby-dev g++ musl-dev make nodejs && \
    rm -rf /var/cache/apk/*

RUN echo "gem: --no-document" > /etc/gemrc 

# create a user and its directories
RUN addgroup -S smashing && adduser -S -G smashing smashing
RUN mkdir /dashboard && chown smashing.smashing /dashboard
RUN mkdir /gem && chown smashing.smashing /gem

USER smashing

# gems to user writeable directory
ENV BUNDLE_PATH=/gem
ENV GEM_HOME=/gem
ENV PATH=$PATH:/gem/bin

# install smashing
RUN gem install bundler smashing io-console json thin etc

# dashboard
RUN smashing new dashboard
WORKDIR /dashboard
RUN bundle install

ENV PORT 3030
EXPOSE ${PORT}
ADD run.sh /dashboard


CMD ["/bin/sh", "run.sh"]