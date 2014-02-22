#!/usr/bin/env bash

npm install -g bower grunt-cli gulp

apt-add-repository ppa:chris-lea/redis-server

apt-get update
apt-get install -yq --no-install-recommends --no-install-suggests \
	redis-server \
	libfreetype6 \
	fontconfig \
	libfontconfig1

ln -s /etc/sv/redis /etc/service/

# Cleanup apt caches
apt-get autoremove
apt-get autoclean
apt-get clean

rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
rm -f /bin/install.sh
