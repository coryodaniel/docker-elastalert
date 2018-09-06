FROM alpine
MAINTAINER docker@coryodaniel.com

ENV HOME /opt/elastalert
ENV RULES_DIR /opt/elastalert/rules

WORKDIR /opt/elastalert

RUN apk update && \
    apk upgrade && \
    apk add \
      ca-certificates \
      gcc \
      libffi-dev \
      musl-dev \
      openntpd \
      openssl \
      openssl-dev \
      python2 \
      python2-dev \
      py2-pip \
      py2-yaml \
      tzdata && \
    pip install --upgrade pip && \
    pip install elastalert && \
    pip install "setuptools>=11.3" && \
    apk del python2-dev && \
    apk del musl-dev && \
    apk del gcc && \
    apk del openssl-dev && \
    apk del libffi-dev && \
    rm -rf /var/cache/apk/* && \
    mkdir -p "${RULES_DIR}"

ENTRYPOINT ["elastalert"]
