FROM alpine:latest

LABEL maintainer "Sid Carter <me@sidcarter.com>"

ENV PATH /usr/local/bin:$PATH
ENV REDIS_VERSION 4.0.6
ENV REPO_URI https://github.com/antirez/redis.git

RUN buildDeps=' \
		bash \
		git \
		gcc \
		make \
		musl-dev \
		linux-headers \
    ' \
    set -x; \
    apk upgrade --update; \
    apk add --no-cache $buildDeps; \
    git clone --branch ${REDIS_VERSION} ${REPO_URI}; \
    # disable protected mode
    grep -q '^#define CONFIG_DEFAULT_PROTECTED_MODE 1$' redis/src/server.h; \
    sed -ri 's!^(#define CONFIG_DEFAULT_PROTECTED_MODE) 1$!\1 0!' redis/src/server.h; \
    grep -q '^#define CONFIG_DEFAULT_PROTECTED_MODE 0$' redis/src/server.h; \
    make -C redis; \
    make -C redis install; \
    rm -rf redis; \
    addgroup -S redis; \
    adduser -S -G redis redis; \
    mkdir -p /redis/data; \
    chown -R redis:redis /redis/data; \
    apk del $buildDeps

EXPOSE 6379
USER redis

CMD ["redis-server"]
