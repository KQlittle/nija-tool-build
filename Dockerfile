FROM python:alpine3.19
WORKDIR /root
RUN apk update && apk upgrade && apk add jq bash curl wget git tzdata
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo "Asia/Shanghai" > /etc/timezone
ENV LANG=zh_CN.UTF-8
ENV LANGUAGE=zh_CN.UTF-8
RUN rm -rf *.apk && rm -rf /var/cache/apk/* && rm -rf locale.md
RUN git clone https://github.com/nianhua99/PandoraNext-Helper.git
COPY PandoraNext-Helper/* . 
RUN pip3 install -r requirements.txt && rm -rf PandoraNext-Helper
COPY main /root
RUN sed -i 's|#!/bin/sh|#!/bin/bash|' /root/main
RUN chmod a+x main
CMD ["/root/main"]
