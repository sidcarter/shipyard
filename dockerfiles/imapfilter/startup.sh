#!/usr/bin/env sh

while :
do
    imapfilter
    sleep ${SLEEP_TIME:-300}
done
