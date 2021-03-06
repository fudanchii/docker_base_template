#!/usr/bin/env bash

set -e
set -x

# Enable us to use apt-add-repository
apt-get update
apt-get install -yq --no-install-recommends --no-install-suggests python-software-properties software-properties-common

# Setup ppa repositories
apt-add-repository ppa:brightbox/ruby-ng
apt-add-repository ppa:chris-lea/node.js
apt-add-repository ppa:git-core/ppa
apt-add-repository ppa:mercurial-ppa/releases

# Install basic required softwares
apt-get update
apt-get install -yq \
    --no-install-recommends --no-install-suggests \
    apt-utils \
    bison \
    build-essential \
    openssh-server \
    openssh-client \
    libssl-dev \
    libxml2-dev \
    libxslt1-dev \
    libpcre3-dev \
    libsqlite3-dev \
    libpq-dev \
    libmysqlclient-dev \
    ruby2.2 \
    ruby2.2-dev \
    libruby2.2 \
    rubygems \
    ruby-switch \
    nodejs \
    python \
    python-pip \
    python-dev \
    curl \
    libcurl4-openssl-dev \
    runit \
    git \
    mercurial \
    socat

# Cleanup apt caches
apt-get autoremove
apt-get autoclean
apt-get clean


ruby-switch --set ruby2.2

echo "gem: --no-ri --no-rdoc" > /etc/gemrc

# Ruby specific packager
gem install bundler --no-ri --no-rdoc

###
#   Provisioning
###

mkdir -p /var/run/sshd

echo root:root123 | chpasswd

cp -R /pv/sv/* /etc/sv/

ln -s /etc/sv/ssh /etc/service/

#########
# Cleanup
rm -rf /pv
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

