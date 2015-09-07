#! /usr/bin/env bash

set -e
set -x

apt-key add nginx_signing.key
echo '
deb http://nginx.org/packages/mainline/ubuntu/ utopic nginx
deb-src http://nginx.org/packages/mainline/ubuntu/ utopic nginx' >> /etc/apt/sources.list

apt-get update
apt-get install -y nginx

apt-get autoremove
apt-get autoclean
apt-get clean

rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
rm -f /bin/install.sh
