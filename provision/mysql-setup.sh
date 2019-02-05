#!/usr/bin/env bash
set +x

sudo yum -y update || exit 1
sudo yum -y install wget || exit 2
sudo wget http://dev.mysql.com/get/mysql80-community-release-el7-2.noarch.rpm || exit 3
sudo rpm -Uvh mysql80-community-release-el7-2.noarch.rpm || exit 4
sudo yum -y install mysql-server || exit 5
sudo yum -y install mysql-community-server || exit 6
sudo systemctl start mysqld || exit 7
sudo systemctl status mysqld || exit 8
exit 0
