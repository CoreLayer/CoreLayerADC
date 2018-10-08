FROM alpine:latest
RUN apk update
RUN apk add openssh-client
RUN apk add git

WORKDIR /corelayer
RUN git clone -b v0.0.1 https://github.com/CoreLayer/CoreLayerADC
RUN ls -alh

WORKDIR /corelayer/CoreLayerADC/installer
RUN sh configure.sh

WORKDIR /