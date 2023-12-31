FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update && apt-get -y install --no-install-recommends apt-utils=2.4.9 && apt-get -y upgrade && apt-get -y install --no-install-recommends \
  ca-certificates=20230311ubuntu0.22.04.1 \
  curl=7.81.0-1ubuntu1.10 \
  bash=5.1-6ubuntu1 \
  jq=1.6-2.1ubuntu3 && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y --no-install-recommends nodejs=16.20.1-deb-1nodesource1 && \
  npm install -g snyk@1.1183.0

COPY init.sh /usr/bin/init.sh
WORKDIR /app
ENTRYPOINT [ "/usr/bin/init.sh" ]