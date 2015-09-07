#! /usr/bin/env bash

set -e

apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8

# Add PostgreSQL's repository. It contains the most recent stable release
#     of PostgreSQL, ``9.3``.
echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" > /etc/apt/sources.list.d/pgdg.list

# Install ``python-software-properties``, ``software-properties-common`` and PostgreSQL 9.3
#  There are some warnings (in red) that show up during the build. You can hide
#  them by prefixing each apt-get statement with DEBIAN_FRONTEND=noninteractive
apt-get update && apt-get install -y python-software-properties software-properties-common postgresql-9.3 postgresql-client-9.3 postgresql-contrib-9.3

# Note: The official Debian and Ubuntu images automatically ``apt-get clean``
# after each ``apt-get``

# Create a PostgreSQL role named ``docker`` with ``docker`` as the password and
# then create a database `docker` owned by the ``docker`` role.
# Note: here we use ``&&\`` to run commands one after the other - the ``\``
#       allows the RUN command to span multiple lines.
sudo -u postgres /etc/init.d/postgresql start
sudo -u postgres psql --command "CREATE USER docker WITH SUPERUSER PASSWORD 'docker';"
sudo -u postgres psql --command "UPDATE pg_database SET datistemplate = FALSE WHERE datname = 'template1';"
sudo -u postgres psql --command "DROP DATABASE template1;"
sudo -u postgres psql --command "CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UNICODE';"
sudo -u postgres psql --command "UPDATE pg_database SET datistemplate = TRUE WHERE datname = 'template1';"
sudo -u postgres psql <<EOF
\c template1
VACUUM FREEZE;
EOF
sudo -u postgres createdb -O docker docker



# Adjust PostgreSQL configuration so that remote connections to the
# database are possible. 
sudo -u postgres echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/9.3/main/pg_hba.conf

# And add ``listen_addresses`` to ``/etc/postgresql/9.3/main/postgresql.conf``
sudo -u postgres echo "listen_addresses='*'" >> /etc/postgresql/9.3/main/postgresql.conf

apt-get autoremove
apt-get autoclean
apt-get clean

rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
rm -f /bin/install.sh
