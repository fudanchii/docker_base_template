FROM fudanchii/base:latest
MAINTAINER Nurahmadie <nurahmadie@gmail.com>

ADD install.sh /bin/
RUN /bin/install.sh

ENV GOPATH /opt/go
ENV PATH /opt/go/bin:/usr/local/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/bin:/sbin

ENTRYPOINT ["/usr/sbin/runsvdir-start"]
