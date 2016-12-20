
FROM wzrdtales/ci-base:latest

MAINTAINER Tobias Gurtzick <magic@wizardtales.com>

ENV DOCKER_BUCKET get.docker.com
ENV DOCKER_VERSION 1.12.5
ENV DOCKER_SHA256 0058867ac46a1eba283e2441b1bb5455df846144f9d9ba079e97655399d4a2c6

USER root

RUN  curl -fSL "https://${DOCKER_BUCKET}/builds/Linux/x86_64/docker-${DOCKER_VERSION}.tgz" -o docker.tgz \
  && echo "${DOCKER_SHA256} *docker.tgz" | sha256sum -c - \
  && tar -xzvf docker.tgz \
  && mv docker/* /usr/local/bin/ \
  && rmdir docker \
  && rm docker.tgz \
  && wget https://releases.rancher.com/cli/v0.4.1/rancher-linux-amd64-v0.4.1.tar.gz -O- | tar -xzv ./rancher-v0.4.1/rancher -O  > /usr/bin/rancher \
  && wget https://releases.rancher.com/compose/v0.12.1/rancher-compose-linux-amd64-v0.12.1.tar.gz -O- | tar -xzv ./rancher-compose-v0.12.1/rancher-compose -O  > /usr/bin/rancher-compose \
  && chmod +x /usr/bin/rancher && chmod +x /usr/bin/rancher-compose \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER cirunner
