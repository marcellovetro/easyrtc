#FROM ubuntu:xenial
FROM node:7-alpine

MAINTAINER Olomedia SRL - Marcello Vetro


# Adding sshkey && Ubuntu update Sources
#RUN apt-get update && apt-get -y upgrade
#RUN apt-get -y install wget nano sudo

#RUN DEBIAN_FRONTEND=noninteractive apt-get -y install --force-yes \
#    curl

# Install NodeJS
#RUN curl -sL https://deb.nodesource.com/setup | bash - && \
#    	apt-get -y install --allow-unauthenticated nodejs npm


RUN mkdir -p /var/nodes/easyrtc

#Copia i sorgenti
COPY . /var/nodes/easyrtc/

#prepara l'ambiente
RUN cd /var/nodes/easyrtc && npm install

#prepara l'ambiente
RUN cd /var/nodes/easyrtc/server_example && npm install

WORKDIR /var/nodes/easyrtc/server_example

ENTRYPOINT node /var/nodes/easyrtc/server_example/server.js


