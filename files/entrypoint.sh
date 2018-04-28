#!/bin/bash

[ ! -r /listenz/Config.php ] && {
  echo "INFO: Bootstrapping Config.php"
  echo "INFO: Generate random cron token"
  # source: https://gist.github.com/earthgecko/3089509
  CRONTOKEN=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)

  echo "INFO: Copying Config.php"
  cat /listenz/Config.php.sample | sed "s|CRONTOKEN|${CRONTOKEN}|g" > /listenz/Config.php
}

cp /listenz/Config.php /var/www/html/listenztracker/Config.php
rm -f /listenz/Config.php.sample

echo "INFO: Starting web server"
/usr/local/bin/apache2-foreground