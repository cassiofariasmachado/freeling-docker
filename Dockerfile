FROM ubuntu:16.04

ARG LOCALE=pt_BR.UTF-8
ARG LOCALE_CONFIG=pt.cfg
ARG LANGUAGE=pt_BR

ENV LANG=$LOCALE
ENV LC_CTYPE=$LOCALE
ENV LANGUAGE=$LANGUAGE
ENV LOCALE_CONFIG=$LOCALE_CONFIG

LABEL MAINTAINER="cassiofariasmachado@yahoo.com"

# Install Freeling
RUN apt-get update -q && \
    apt-get install -y locales \
    libboost-program-options1.58.0 libboost-regex1.58.0 libboost-filesystem1.58.0 libboost-system1.58.0 \
    wget

RUN locale-gen $LOCALE
RUN locale-gen en_US.UTF-8

RUN wget https://github.com/TALP-UPC/FreeLing/releases/download/4.0/freeling-4.0-xenial-amd64.deb

RUN dpkg -i freeling-4.0-xenial-amd64.deb

RUN rm freeling-4.0-xenial-amd64.deb

# Clean packages
RUN apt-get --purge -y remove wget && \
    apt-get autoremove -y && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 5000
ENTRYPOINT analyze -f $LOCALE_CONFIG --server --port 5000