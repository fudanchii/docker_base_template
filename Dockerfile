FROM stackbrew/ubuntu:12.04
MAINTAINER Nurahmadie <nurahmadie@gmail.com>

RUN apt-get update && apt-get install -yq python-software-properties && \
    apt-add-repository ppa:brightbox/ruby-ng && \
    apt-add-repository ppa:git-core/ppa && \
    apt-add-repository ppa:mercurial-ppa/releases && \
    apt-get update && apt-get install -yq \
    apt-utils \
    build-essential \
    openssh-server \
    openssh-client \
    libssl-dev \
    libxml2-dev \
    libxslt1-dev \
    libpcre3-dev \
    libsqlite3-dev \
    ruby2.1 \
    ruby2.1-dev \
    libruby2.1 \
    rubygems \
    python \
    python-pip \
    python-dev \
    curl \
    runit \
    git \
    mercurial \
    --no-install-recommends && apt-get autoremove && apt-get autoclean && apt-get clean

RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /var/run/sshd

RUN echo root:root123 | chpasswd

ADD sv/ /etc/sv

RUN ln -s /etc/sv/ssh /etc/service/

CMD ["/usr/sbin/runsvdir-start"]
