#!/usr/bin/env bash

useradd -m ubuntu
mkdir -p /var/cache/drone

npm install -g bower grunt-cli gulp

apt-add-repository ppa:chris-lea/redis-server

apt-get update
apt-get install -yq --no-install-recommends --no-install-suggests \
	wget \
	redis-server \
	libfreetype6 \
	fontconfig \
	libfontconfig1 \
	mysql-client-5.5 \
	imagemagick \
	libxrender1 \
	xfonts-base \
	xfonts-75dpi \
	qt5-default \
	libqt5webkit5-dev \
	xvfb \
	dbus-x11

cd /tmp && wget http://download.gna.org/wkhtmltopdf/0.12/0.12.2.1/wkhtmltox-0.12.2.1_linux-trusty-amd64.deb && \
	dpkg -i wkhtmltox-0.12.2.1_linux-trusty-amd64.deb

ln -s /etc/sv/redis /etc/service/

# Cleanup apt caches
apt-get autoremove
apt-get autoclean
apt-get clean

rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
rm -f /bin/install.sh
