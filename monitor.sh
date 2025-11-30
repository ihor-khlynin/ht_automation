#!/bin/bash

LOGFILE="$HOME/automation/log/monitor.log"

mkdir -p "$(dirname "$LOGFILE")"

TIMESTAMP=$(date "+%d-%m-%Y %H:%M:%S")

CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8 "%"}')

RAM_USAGE=$(free | awk '/Mem:/ {printf("%.1f%%", $3/$2 * 100)}')

DISK_USAGE=$(df -h / | awk 'NR==2{print $5}')

echo "$TIMESTAMP | CPU: $CPU_USAGE | RAM: $RAM_USAGE | DISK: $DISK_USAGE" >> "$LOGFILE"
