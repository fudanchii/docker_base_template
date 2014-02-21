FROM stackbrew/ubuntu:12.04
MAINTAINER Nurahmadie <nurahmadie@gmail.com>

RUN mkdir /pv
ADD export/ /pv
RUN /pv/apt.sh

ENTRYPOINT ["/usr/sbin/runsvdir-start"]
