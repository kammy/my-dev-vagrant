# DOCKER-VERSION 0.11.1
#
# Nginx Dockerfile
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
RUN apt-get install -y --no-install-recommends locales supervisor

RUN echo en_US.UTF-8 UTF-8 > /etc/locale.gen
RUN locale-gen
RUN update-locale LANG=en_US.UTF-8

# Install Nginx.
RUN apt-get install -y --no-install-recommends nginx && \
  echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
  chown -R www-data:www-data /var/log/nginx

# Install php.
RUN apt-get install -y --no-install-recommends \
  php5-fpm \
  php5-memcached \
  php5-mysqlnd \
  php-apc \
  php5-mcrypt

RUN echo "cgi.fix_pathinfo = 0;" >> /etc/php5/fpm/php.ini
RUN sed -i -e "s/;daemonize\s*=\s*yes/daemonize = no/" /etc/php5/fpm/php-fpm.conf
RUN sed -i -e "s/error_log\s*=\s*.*/error_log = \/var\/log\/php\/php5-fpm.log/" /etc/php5/fpm/php-fpm.conf
RUN sed -i -e 's/^listen =.*/listen = \/var\/run\/php5-fpm.sock/' /etc/php5/fpm/pool.d/www.conf

# Clean up
RUN apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

# Define mountable directories.
VOLUME ["/data", "/etc/nginx/sites-enabled", "/var/log/nginx", "/etc/php5/", "/var/log/php"]

# Settings
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD site_default /etc/nginx/sites-available/default

# Expose ports.
EXPOSE 80
#EXPOSE 443

CMD ["/usr/bin/supervisord"]
