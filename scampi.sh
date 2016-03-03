#!/bin/bash
cd /usr/scampi/
java -jar /usr/scampi/SCAMPI.jar -s -l debug /usr/scampi/default_settings.txt >> /var/log/scampi/scampiService.log
