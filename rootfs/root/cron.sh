
#!/bin/bash
while true; do
	php -f /selfoss/cliupdate.php
	sleep $CRON_PERIOD
done