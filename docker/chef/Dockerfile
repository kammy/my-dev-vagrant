# DOCKER-VERSION 0.11.1
#
# Nginx Dockerfile
#
MAINTAINER shuichi.kura@gmail.com

# Pull base image.
FROM debian:wheezy

# Preparations

ENV DEBIAN_FRONTEND nonintaractive
ENV LC_ALL C
RUN echo "Asia/Tokyo/" > /etc/timezone && dpkg-reconfigure -f nonintaractive tzdata
RUN apt-get update && apt-get upgrade -y

# Install Nginx.

RUN apt-get install -y nginx --no-install-recommends && \
  echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
  chown -R www-data:www-data /var/lib/nginx

# Clean up
RUN apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

# Define mountable directories.
VOLUME ["/data", "/etc/nginx/sites-enabled", "/var/log/nginx"]

# Define working directory.
WORKDIR /etc/nginx

# Define default command.
CMD ["nginx"]

# Expose ports.
EXPOSE 80
EXPOSE 443
