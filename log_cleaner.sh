#!/bin/bash

LOG_DIR="$HOME/automation/log/"
find "$LOG_DIR" -type f -mtime +30 -exec rm -f {} \;
echo "Logs older than 30 days deleted."