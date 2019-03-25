# mzum/docker-websocket
FROM ubuntu:14.04

ARG TAG
LABEL TAG=${TAG}

LABEL maintainer="mzum@mzum.org"

ENV REFRESHED_AT 2018-03-24

WORKDIR /tmp

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y nodejs

# needs this to find the nodejs exec
RUN ln -s /usr/bin/nodejs /usr/bin/node

RUN apt-get install -y npm
RUN /usr/bin/npm install ws

EXPOSE 8080

ENTRYPOINT ["/usr/bin/node", "/root/server.js"]
