FROM php:7.2-apache

ENV listenz_version="1.0"

LABEL maintainer="bjoern-docker@innovention.de"
LABEL version="{$listenz_version}"
LABEL description="Web server with ListenzTracker script (liste.nz) \
                   to scrobble Spotify data to Last.fm"

RUN apt-get update && apt-get install -y \
    unzip && \
    rm -rf rm -rf /var/lib/apt/lists/* && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www/html
RUN curl -o tracker.zip https://static.liste.nz/dl/tracker/${listenz_version}/listenztracker1.zip && \
    unzip tracker.zip && \
    rm tracker.zip && \
    cd listenztracker && \
    composer update

