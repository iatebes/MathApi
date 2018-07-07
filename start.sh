#!/bin/bash
chown -R mysql:mysql /var/lib/mysql /var/run/mysqld
service mysql start
/usr/apache-tomcat-8.5.32/bin/startup.sh
tail -f /dev/null