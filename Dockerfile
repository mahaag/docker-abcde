FROM debian:jessie
MAINTAINER Benoît Vidis

RUN echo "deb http://www.deb-multimedia.org jessie main non-free" >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y --force-yes deb-multimedia-keyring && \
    apt-get install -y --force-yes abcde && \
    mkdir -p /abcde/out

ADD .abcde.conf /abcde/.abcde.conf


ENTRYPOINT [ "abcde" ]
