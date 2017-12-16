FROM debian:sid

LABEL maintainer "Sid Carter <me@sidcarter.com>"

# do all in one step
RUN set -ex && \
    apt-get update && \
    apt-get -y install git python python-pip && \
    pip install -U azure-cli
