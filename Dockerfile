# Prepare nodejs and PHP combination
#
# VERSION               0.1

FROM ubuntu:15.10
MAINTAINER Marcel Radzio <info@nordgedanken.de>

RUN echo "deb http://archive.ubuntu.com/ubuntu precise universe" >> /etc/apt/sources.list

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -qq update
RUN apt-get install -y bsdmainutils curl screen wget
RUN curl -sL https://deb.nodesource.com/setup_5.x | bash -
RUN apt-get update
RUN apt-get install -y nodejs build-essential checkinstall php5 libavahi-compat-libdnssd-dev
RUN apt-get install -y libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev

RUN wget http://python.org/ftp/python/2.7.11/Python-2.7.11.tgz
RUN tar -xvf Python-2.7.11.tgz
RUN cd Python-2.7.11 && ./configure && make && make install && checkinstall

RUN npm install -g strongloop



RUN useradd --create-home server

WORKDIR /home/server
VOLUME /home/server
