FROM python:3.9-slim-bookworm
WORKDIR /root
RUN apt-get update && apt-get install jq bash curl wget
ENV TZ Asia/Shanghai
COPY main /root
COPY PandoraNext-Helper-0.6.8/* /root
RUN pip install -r requirements.txt --no-cache-dir -i https://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com
RUN sed -i 's|#!/bin/sh|#!/bin/bash|' /root/main
RUN chmod a+x main
CMD ["/root/main"]

