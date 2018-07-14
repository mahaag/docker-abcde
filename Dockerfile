FROM alpine:3.8

LABEL com.benoitvidis.vendor="Benoît Vidis <contact@benoitvidis.com>"

ENV EDITOR=vim
ENV TERM=xterm-color
ENV LANG=C.UTF-8 
ENV LC_ALL=C.UTF-8 

RUN  set -x \
  \
  && apk add --no-cache --virtual deps \
      build-base \
      curl \
      libxml2-dev \
      linux-headers \
      perl-dev \
      perl-utils \
  && apk add --no-cache \
      abcde \
      cdparanoia \
      flac \
      lame \
      libcddb \
      libxml2 \
      mutagen \
      perl \
      vim \
  \
	&& mkdir -p /abcde/out \
  && echo "syntax on\nset expandtab ts=4 sw=4 autoindent encoding=utf8" >> etc/vim/vimrc \
  \
  && curl -SLo /tmp/libdiscid.tar.gz http://ftp.musicbrainz.org/pub/musicbrainz/libdiscid/libdiscid-0.6.2.tar.gz \
  && cd /tmp \
  && tar xvf libdiscid.tar.gz \
  && cd libdiscid-0.6.2 \
  && ./configure \
  && make \
  && make install \
  \
  && cpan -f -i -q \
    XML::LibXML \
    YAML \
    WebService::MusicBrainz::Track \
    WebService::MusicBrainz::Release \
    MusicBrainz::DiscID \
    MusicBrainz \
  \
  && apk del deps \
  \
  && echo done

COPY abcde.conf /etc/abcde.conf


ENTRYPOINT [ "abcde" ]
