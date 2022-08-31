
#!/bin/bash
while true; do
	php -f /var/www/html/cliupdate.php
	sleep $CRON_PERIOD
done