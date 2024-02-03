FROM alpine:latest
WORKDIR /root
RUN apk update && apk upgrade && apk add --update openjdk11-jdk jq bash curl wget tzdata
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo "Asia/Shanghai" > /etc/timezone
ENV LANG=zh_CN.UTF-8
ENV LANGUAGE=zh_CN.UTF-8
RUN rm -rf *.apk && rm -rf /var/cache/apk/* && rm -rf locale.md
COPY main /root
RUN sed -i 's|#!/bin/sh|#!/bin/bash|' /root/main
RUN chmod a+x main
CMD ["/root/main"]
