FROM alpine:latest

MAINTAINER Sid Carter <me@sidcarter.com>

ENV IMAPFILTER_VERSION v2.6.11

# do all in one step
RUN set -ex && \
    apk upgrade --update && \
    apk add --no-cache lua pcre openssl && \
    apk add --no-cache --update --virtual=.build-dependencies \
	openssl-dev \
	make \
	lua-dev \
	pcre-dev \
	alpine-sdk \
	git && \
    git clone https://github.com/lefcha/imapfilter.git && \
    cd imapfilter && \
    git checkout tags/${IMAPFILTER_VERSION} && \
    make all && \
    make install && \
    apk del .build-dependencies

ENTRYPOINT ["imapfilter"]
