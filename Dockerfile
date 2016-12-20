
FROM docker:latest

MAINTAINER Tobias Gurtzick <magic@wizardtales.com>

RUN apk add --no-cache bash && \
  wget https://releases.rancher.com/cli/v0.4.1/rancher-linux-amd64-v0.4.1.tar.gz -O- | tar -xzv ./rancher-v0.4.1/rancher -O  > /usr/bin/rancher \
  && wget https://releases.rancher.com/compose/v0.12.1/rancher-compose-linux-amd64-v0.12.1.tar.gz -O- | tar -xzv ./rancher-v0.4.1/rancher -O  > /usr/bin/rancher-compose \
  && groupadd --gid 1000 deploy \
  && useradd --uid 1000 --gid deploy --shell /bin/bash --create-home deploy \
  && chmod +x /usr/bin/rancher /usr/bin/rancher-compose

USER deploy
WORKDIR /home/deploy
