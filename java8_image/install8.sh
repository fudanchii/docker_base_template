#!/usr/bin/env bash

useradd -m ubuntu

echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
add-apt-repository -y ppa:webupd8team/java


apt-get update
apt-get install -yq --no-install-recommends --no-install-suggests \
	unzip \
	wget \
	redis-server \
	libfreetype6 \
	fontconfig \
	libfontconfig1 \
	mysql-client-5.5 \
	oracle-java8-installer
	

# Gradle
cd /usr/share
wget https://services.gradle.org/distributions/gradle-2.2.1-all.zip
unzip gradle-2.2.1-all.zip
rm gradle-2.2.1-all.zip

wget http://mirror.sdunix.com/apache/maven/maven-3/3.3.3/binaries/apache-maven-3.3.3-bin.tar.gz
tar -xf apache-maven-3.3.3-bin.tar.gz
rm -f apache-maven-3.3.3-bin.tar.gz

# Cleanup apt caches
apt-get autoremove
apt-get autoclean
apt-get clean

rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
rm -f /bin/install.sh
