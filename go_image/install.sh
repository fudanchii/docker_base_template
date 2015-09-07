#! /usr/bin/env bash

set -e
set -x

mkdir -p /var/cache/drone

apt-get update 1> /dev/null 2> /dev/null
apt-get -y install ruby2.1 ruby2.1-dev zip bzip2 libsqlite3-dev sqlite3 rpm dpkg 1> /dev/null 2> /dev/null
gem2.1 install fpm

go get golang.org/x/tools/cmd/vet
go get golang.org/x/tools/cmd/cover

# Cleanup apt caches
apt-get autoremove
apt-get autoclean
apt-get clean

rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
rm -f /bin/install.sh
