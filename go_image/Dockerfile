FROM golang:latest
MAINTAINER Nurahmadie <nurahmadie@gmail.com>

ADD install.sh /bin/
RUN /bin/install.sh

ENV GOPATH=/var/cache/drone

ADD drone.key /.drone.key

