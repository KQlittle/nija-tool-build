FROM python:3.9-slim-bookworm
WORKDIR /root
RUN apk update && apk upgrade && apk add jq bash curl wget
ENV TZ Asia/Shanghai
COPY main /root
COPY PandoraNext-Helper-0.6.8/* /root
RUN pip install -r requirements.txt --no-cache-dir -i https://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com
RUN sed -i 's|#!/bin/sh|#!/bin/bash|' /root/main
RUN rm -rf *.apk && rm -rf /var/cache/apk/* && rm -rf locale.md
RUN chmod a+x main
CMD ["/root/main"]

