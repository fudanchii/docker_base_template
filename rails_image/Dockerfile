FROM fudanchii/base:latest
MAINTAINER Nurahmadie <nurahmadie@gmail.com>

ADD sv/redis/run /etc/sv/redis/

ADD install.sh /bin/
RUN /bin/install.sh

ADD bin/phantomjs /bin/

EXPOSE 22 6379

ENTRYPOINT ["/usr/sbin/runsvdir-start"]
