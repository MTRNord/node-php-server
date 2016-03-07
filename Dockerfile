# Prepare nodejs and PHP combination
#
# VERSION               0.1

FROM ubuntu:12.04 MAINTAINER Marcel Radzio <info@nordgedanken.de>

RUN echo "deb http://archive.ubuntu.com/ubuntu precise universe" >> /etc/apt/sources.list

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -qq update
RUN apt-get install -y bsdmainutils curl screen
RUN curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
RUN sudo apt-get install -y nodejs build-essential php

RUN npm install -g strongloop



RUN useradd --create-home server

WORKDIR /home/server
VOLUME /home/server
