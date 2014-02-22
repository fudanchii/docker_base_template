#! /usr/bin/env bash

set -e
set -x

sudo add-apt-repository ppa:fkrull/deadsnakes
apt-get update
apt-get install -yq --no-install-recommends --no-install-suggests \
    python3.3 python2.6


# Cleanup apt caches
apt-get autoremove
apt-get autoclean
apt-get clean

rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
rm -f /bin/install.sh
