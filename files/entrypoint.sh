#!/bin/bash

[ ! -r /listenz/Config.php ] && {
  echo "ERROR: Config.php for ListenzTracker not found"
  exit 1
}

echo "INFO: Generate random cron token"
# source: https://gist.github.com/earthgecko/3089509
CRONTOKEN=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)

echo "INFO: Copying Config.php"
cat /listenz/Config.php | sed "s|CRONTOKEN|${CRONTOKEN}|g" > /var/www/html/listenztracker/Config.php

echo "INFO: Starting web server"
/usr/local/bin/apache2-foreground

# TODO: Create a cronjob for yourdomain.com/run.php?t=<your random secret key>1 or use cli
# via php run.php 1 Minute or less is recommended. Otherwise the authentication
# might expire