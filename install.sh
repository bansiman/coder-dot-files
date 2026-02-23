#!/bin/bash
# Ensure cron service is running
sudo service cron start || true
# Load your crontab from the persistent home directory
if [ -f "$HOME/.my_persistent_cron" ]; then
    crontab "$HOME/.my_persistent_cron"
fi