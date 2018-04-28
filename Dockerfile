FROM php:7.2-apache

ENV listenz_version="1.0"

LABEL maintainer="bjoern-docker@innovention.de"
LABEL version="{$listenz_version}"
LABEL description="Web server with ListenzTracker script (liste.nz) to scrobble Spotify data to Last.fm"

# install unzip & composer
RUN apt-get update && apt-get install -yq \
  unzip && \
  rm -rf /var/lib/apt/lists/* && \
  curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# get tracker release and install dependencies
WORKDIR /var/www/html
RUN curl -o tracker.zip https://static.liste.nz/dl/tracker/${listenz_version}/listenztracker1.zip && \
  unzip tracker.zip && \
  rm tracker.zip && \
  mv listenztracker/* . && \
  composer update

RUN mkdir /listenz
VOLUME [ "/listenz" ]

# setup entrypoint
RUN mkdir /docker
COPY files/entrypoint.sh /docker/entrypoint.sh
RUN chmod 755 /docker/entrypoint.sh
ENTRYPOINT ["/docker/entrypoint.sh"]

COPY default/Config.php /listenz/Config.php.sample

EXPOSE 80
