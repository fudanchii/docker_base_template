FROM fudanchii/base:latest
MAINTAINER Nurahmadie <nurahmadie@gmail.com>

ADD install.sh /bin/
RUN /bin/install.sh

ENTRYPOINT ["/usr/sbin/runsvdir-start"]
