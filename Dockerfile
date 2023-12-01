FROM python:3.11.3
MAINTAINER rmetcalf9@googlemail.com

COPY /src /opt/executor
WORKDIR /opt/executor
