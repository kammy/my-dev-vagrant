#!/bin/sh

docker run -p 80:80 -d -v /vagrant/docker/webapp/www:/data --volumes-from mysql_data kammy/webapp
