#!/usr/bin/env bash

apt-get -y update \
	&& apt-get upgrade -y \
	&& apt-get install nginx -y \
	&& apt-get install openjdk-8-jre -y \
	&& apt-get install mongodb-server -y

# Copy the configuration file for nginx
cp ./nginx-scampiRest /etc/nginx/sites-available/default

# copy the Rest-API to /usr
cp ./scampiREST-1.0-SNAPSHOT.jar /usr/scampiREST-1.0-SNAPSHOT.jar
chown www-data:root /usr/scampiREST-1.0-SNAPSHOT.jar

# copy the startupscript for the rest api
cp ./scampiRest.sh /usr/scampiRest.sh
chmod 700 /usr/scampiRest.sh

# copy the scampi server with its defaul settings
mkdir /usr/scampi/
mkdir /var/log/scampi
cp ./default_settings.txt /usr/scampi/default_settings.txt
cp ./SCAMPI.jar /usr/scampi/SCAMPI.jar
chmod 700 /usr/scampi/SCAMPI.jar

# copy the startupscript for the scampi server
cp ./scampi.sh /usr/scampi.sh
chmod 700 /usr/scampi.sh

# create necessary files and folders
mkdir /var/tmp/scampiRest
mkdir /var/tmp/nginxFiles
cp -R ./static /var/tmp/nginxFiles/

# create logfiles
touch /var/log/scampi/scampiService.log
chmod 222 /var/log/scampi/scampiService.log
touch /var/log/scampi/scampiRest.log
chmod 222 /var/log/scampi/scampiRest.log

echo "Finish!"
exit 0
