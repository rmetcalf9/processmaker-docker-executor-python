ARG PYTHON_IMAGE

FROM ${PYTHON_IMAGE}

MAINTAINER rmetcalf9@googlemail.com

COPY ./requirements.txt requirements.txt
RUN pip3 install -r requirements.txt


COPY /src /opt/executor
WORKDIR /opt/executor
