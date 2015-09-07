FROM fudanchii/base:latest
MAINTAINER Nurahmadie <nurahmadie@gmail.com>

ADD install.sh /bin/
RUN /bin/install.sh

ADD bin/phantomjs /bin/
ADD drone.key /home/ubuntu/

EXPOSE 22

ENTRYPOINT ["/bin/sh"]
