# bash-script-weekly-server-maintenance

# Purpose: This script is to run as a cronjob every Friday at 11pm to update the server and log the output.

# By: Belinda Dunu

# Date: August 30, 2023


#!/bin/bash

# Update the server packages  

sudo apt update

# Get the number of packages that can be upgraded

sudo apt list --upgradable

upgrades=$(apt list --upgradeable)

# Create a dated log file and output the number of upgradable packages

echo "$upgrades packages can be upgraded" > update$(date +%m.%d.%y).txt

# Edit the crontab config

crontab -e

# Schedule script to run weekly on Fridays at 11pm

0 23 * * 5 /usr/local/bin/script.sh
