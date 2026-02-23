#!/bin/bash
# 1. Start the service
sudo service cron start || true

# 2. Get the directory where THIS script is located
DOTFILES_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

# 3. Load the crontab using the absolute path
if [ -f "$DOTFILES_DIR/.my_persistent_cron" ]; then
    crontab "$DOTFILES_DIR/.my_persistent_cron"
    echo "Crontab loaded from $DOTFILES_DIR/.my_persistent_cron"
else
    echo "Error: .my_persistent_cron not found in $DOTFILES_DIR"
fi