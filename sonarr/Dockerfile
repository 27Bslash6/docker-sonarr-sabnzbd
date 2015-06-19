# Use phusion/baseimage as base image. To make your builds reproducible, make
# sure you lock down to a specific version, not to `latest`!
# See https://github.com/phusion/baseimage-docker/blob/master/Changelog.md for
# a list of version numbers.
FROM phusion/baseimage:0.9.16
MAINTAINER Ray Walker <hello@raywalker.it>

ENV USER fish
ENV UID 1000

COPY sources.list /etc/apt/sources.list

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys FDA5DFFC \
  && echo "deb http://apt.sonarr.tv/ develop main" | tee -a /etc/apt/sources.list \
  && apt-get update -q \
  && apt-get install -qy nzbdrone mediainfo \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN useradd --no-create-home -g users --uid $UID $USER \
  && chown -R $USER:users /opt/NzbDrone
#   && mkdir -p /volumes/config/sonarr \
#   && chown -R $USER:users /volumes

# VOLUME /volumes/config /volumes/downloads /volumes/media

EXPOSE 8989
EXPOSE 9898

ADD start.sh /
ADD sonarr-update.sh /sonarr-update.sh

RUN chmod +x /start.sh \
  && chmod 755 /sonarr-update.sh \
  && chown $USER:users /sonarr-update.sh

USER $USER
WORKDIR /opt/NzbDrone

ENTRYPOINT ["/start.sh"]
