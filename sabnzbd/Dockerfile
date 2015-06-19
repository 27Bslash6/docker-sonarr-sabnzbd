# Use phusion/baseimage as base image. To make your builds reproducible, make
# sure you lock down to a specific version, not to `latest`!
# See https://github.com/phusion/baseimage-docker/blob/master/Changelog.md for
# a list of version numbers.
FROM phusion/baseimage:0.9.16

MAINTAINER Ray Walker <hello@raywalker.it>

ENV SABNZBD_USER fish
ENV UID 1000

COPY sources.list /etc/apt/sources.list

RUN add-apt-repository ppa:jcfp/ppa \
    && apt-get -q update && apt-get install -qy --force-yes sabnzbdplus sabnzbdplus-theme-classic sabnzbdplus-theme-mobile sabnzbdplus-theme-plush unrar

RUN apt-get -y autoremove && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

EXPOSE 8080
EXPOSE 9090

RUN useradd --no-create-home -g users --uid $UID $SABNZBD_USER

USER $SABNZBD_USER

CMD ["sabnzbdplus", "-f", "/volumes/config/sabnzbd"]
