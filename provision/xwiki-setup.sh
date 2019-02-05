#!/usr/bin/env bash
set +x

sudo apt-get install -y screen || exit 5
sudo apt-get update && sudo apt-get upgrade -y || exit 6
sudo apt-get install -y tomcat8 || exit 7
wget -q "http://maven.xwiki.org/public.gpg" -O- | sudo apt-key add - || exit 8
##sudo wget "http://maven.xwiki.org/stable/xwiki-stable.list" -P /etc/apt/sources.list.d/ || exit 9
sudo wget -P /etc/apt/sources.list.d/ http://maven.xwiki.org/stable/xwiki-stable.list || exit 9
sudo apt-get update ||exit 10
sudo apt-get install -y xwiki-enterprise-tomcat8-mysql || exit 11
sudo mkdir /var/lib/tomcat8/bin
sudo touch /var/lib/tomcat8/bin/setenv.sh || exit 12
sudo chown vagrant:vagrant /var/lib/tomcat8/bin/setenv.sh
sudo echo '#!/bin/sh' > /var/lib/tomcat8/bin/setenv.sh
sudo echo 'export JAVA_OPTS="${JAVA_OPTS} -Djava.awt.headless=true"' >> /var/lib/tomcat8/bin/setenv.sh
sudo echo 'CATALINA_OPTS="-Xms512M -Xmx1024M -XX:PermSize=512M -XX:MaxPermSize=512M"' >> /var/lib/tomcat8/bin/setenv.sh || exit 13
sudo /etc/init.d/tomcat8 restart




exit 0

