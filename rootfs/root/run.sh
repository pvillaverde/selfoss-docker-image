#!/bin/bash

# Selfoss custom configuration file
sed -i "s/lkjl1289/`cat \/dev\/urandom | tr -dc 'a-zA-Z' | fold -w 20 | head -n 1`/g" /var/www/html/defaults.ini
rm -f /var/www/html/config.ini

if [ -e /var/www/html/data/config.ini ]; then
	cp /var/www/html/data/config.ini /var/www/html/config.ini
else
	cp /var/www/html/defaults.ini /var/www/html/data/config.ini
	cp /var/www/html/defaults.ini /var/www/html/config.ini
fi
# Reset permissions
chown -R www-data:www-data /var/www/html
# Launch cron & web
bash /root/cron.sh &
apache2-foreground