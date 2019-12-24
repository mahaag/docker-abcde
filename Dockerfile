FROM alpine:3.10

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
      less \
      libcddb \
      libxml2 \
      mutagen \
      perl \
      python3 \
      vim \
  \
	&& mkdir -p /abcde/out \
  && echo -n "\nsyntax on\nset expandtab\nset tabstop=4\nset shiftwidth=4\nsset autoindent\nset encoding=utf8" >> etc/vim/vimrc \
  \
  && pip3 install -U \
    eyed3 \
    pylast==2.4.0 \
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
    WebService::MusicBrainz \
    MusicBrainz::DiscID \
    MusicBrainz \
  \
  && apk del deps \
  \
  && echo done

COPY abcde.conf /etc/abcde.conf


ENTRYPOINT [ "abcde" ]
