#! /usr/bin/env bash

set -e
set -x

mkdir -p /root
export HOME=/root

pushd ./
mkdir -p /tmp/gvm
cd /tmp/gvm && bash < <(curl -s https://raw.github.com/moovweb/gvm/master/binscripts/gvm-installer)
source $HOME/.gvm/scripts/gvm
popd

gvm install go1.1
gvm install go1.2
gvm install go1.2.1

rm -rf $HOME/.gvm/archive/go
rm -rf /tmp/gvm

rm /bin/install.sh
