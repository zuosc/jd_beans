FROM python:3.7.6-alpine

RUN apk add tzdata && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && apk del tzdata && rm -rf /var/cache/apk/*

COPY ./jd_beans.py /app/jd/jd_beans.py

COPY ./requirements.txt /requirements.txt
RUN pip install  --no-cache-dir --requirement /requirements.txt

COPY ./cronpy /tmp/cronpy
RUN (crontab -l ; cat /tmp/cronpy) | crontab -  && rm -rf /tmp/*
