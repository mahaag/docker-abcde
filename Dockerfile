FROM debian:jessie
MAINTAINER Benoît Vidis

ENV EDITOR=vim
ENV TERM=xterm-color

ADD https://www.deb-multimedia.org/pool/main/d/deb-multimedia-keyring/deb-multimedia-keyring_2015.6.1_all.deb /root/
RUN echo "deb http://www.deb-multimedia.org jessie main non-free" >> /etc/apt/sources.list && \
    dpkg -i /root/deb-multimedia-keyring_2015.6.1_all.deb && \
    apt-get update && \
    apt-get install -y \
        abcde \
        eyed3 \
        flac \
        id3 \
        nano \
        lame \
        vim && \
    mkdir -p /abcde/out && \
    echo "syntax on\nset expandtab ts=4 sw=4 autoindent" >> etc/vim/vimrc

ADD abcde.conf /etc/abcde.conf


ENTRYPOINT [ "abcde" ]
