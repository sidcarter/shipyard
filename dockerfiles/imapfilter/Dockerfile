FROM alpine:latest

LABEL maintainer "Sid Carter <me@sidcarter.com>"

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
    git clone --branch ${IMAPFILTER_VERSION} https://github.com/lefcha/imapfilter.git && \
    cd imapfilter && \
    make all && \
    make install && \
    apk del .build-dependencies

COPY ./startup.sh .

CMD ["imapfilter"]
