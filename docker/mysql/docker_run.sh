#!/bin/sh

docker run -d --volumes-from mysql_data --name mysql kammy/mysql
