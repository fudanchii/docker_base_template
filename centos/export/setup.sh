#! /usr/bin/env bash

set -e
set -x


rpm -ivh http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

yum update -y
yum groupinstall -y 'Development Tools'
yum install -y git
yum clean all

rm -rf /tmp/*
cd / && rm -rf /provisioning
