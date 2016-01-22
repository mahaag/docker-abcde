FROM debian:jessie
MAINTAINER Benoît Vidis

ENV EDITOR=vim
ADD https://www.deb-multimedia.org/pool/main/d/deb-multimedia-keyring/deb-multimedia-keyring_2015.6.1_all.deb /root/
RUN echo "deb http://www.deb-multimedia.org jessie main non-free" >> /etc/apt/sources.list && \
    dpkg -i /root/deb-multimedia-keyring_2015.6.1_all.deb && \
    apt-get update && \
    apt-get install -y \
        abcde \
        flac \
        id3 \
        nano \
        lame \
        vim && \
    mkdir -p /abcde/out

ADD .abcde.conf /abcde/.abcde.conf


ENTRYPOINT [ "abcde", "-c", "/abcde/.abcde.conf" ]
