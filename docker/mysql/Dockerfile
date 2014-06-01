# DOCKER-VERSION 0.11.1
#
# MySQL Dockerfile
#

FROM debian:wheezy
MAINTAINER Kammy <shuichi.kura@gmail.com>

# Preparations

ENV DEBIAN_FRONTEND nonintaractive
ENV LC_ALL C
RUN echo "Asia/Tokyo/" > /etc/timezone && dpkg-reconfigure -f nonintaractive tzdata
RUN echo "deb http://cdn.debian.net/debian/ wheezy main contrib non-free" > /etc/apt/sources.list
RUN echo "deb http://cdn.debian.net/debian/ wheezy-updates main contrib" >> /etc/apt/sources.list
#RUN apt-get update && apt-get install -y --no-install-recommends apt-utils software-properties-common
#RUN add-apt-repository -y ppa:nginx/stable

RUN apt-get update && apt-get upgrade -y

# locale
RUN apt-get install -y --no-install-recommends locales python supervisor cron

RUN echo en_US.UTF-8 UTF-8 > /etc/locale.gen
RUN locale-gen
RUN update-locale LANG=en_US.UTF-8

# Install MySQL.
RUN apt-get install -y --no-install-recommends \
    mysql-server-core-5.5 \
    mysql-client-5.5

# Clean up
RUN apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

# Define mountable directories.
VOLUME ["/mysql"]

# Settings
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD run-mysqld /run-mysqld

# Expose ports.
EXPOSE 3306

CMD ["/usr/bin/supervisord"]
