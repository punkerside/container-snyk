FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update && apt-get -y install --no-install-recommends apt-utils && apt-get -y upgrade && apt-get -y install --no-install-recommends \
  ca-certificates \
  curl \
  bash \
  jq && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y --no-install-recommends nodejs && \
  npm install -g snyk@1.1183.0

COPY init.sh /usr/bin/init.sh
WORKDIR /app
ENTRYPOINT [ "/usr/bin/init.sh" ]