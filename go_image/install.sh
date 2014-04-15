#! /usr/bin/env bash

set -e
set -x

mkdir -p /root
mkdir -p /opt/go
export HOME=/root

cd /usr/local
curl https://go.googlecode.com/files/go1.2.1.linux-amd64.tar.gz -o go1.2.1.linux-amd64.tar.gz
tar -xf go1.2.1.linux-amd64.tar.gz

rm -rf go1.2.1.linux-amd64.tar.gz

rm /bin/install.sh
