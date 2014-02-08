FROM fudanchii/base
MAINTAINER Nurahmadie <nurahmadie@gmail.com>

RUN sudo add-apt-repository ppa:fkrull/deadsnakes && \
    apt-get update && \
    apt-get install -yq --no-install-recommends --no-install-suggests \
    python3.3 \
    python2.6

CMD ["/usr/sbin/runsvdir-start"]
