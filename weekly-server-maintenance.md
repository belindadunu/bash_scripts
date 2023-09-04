# bash-script-weekly-server-maintenance

Purpose: This script is to run as a cronjob every Friday at 11pm to update the server and log the output.

By: Belinda Dunu

Date: August 30, 2023


**#!/bin/bash**

**_Update the server packages_**  

`$ sudo apt update` 

**_Get the number of packages that can be upgraded_** 

`$ sudo apt list --upgradable` 

`$ upgrades=$(apt list --upgradeable)` 

**_Create a dated log file and output the number of upgradable packages_**

`$ echo "$upgrades packages can be upgraded" > update$(date +%m.%d.%y).txt`

**_Edit the crontab config_** 

`$ crontab -e`

**_Schedule script to run weekly on Fridays at 11pm_**

`$ 0 23 * * 5 /usr/local/bin/script.sh`
