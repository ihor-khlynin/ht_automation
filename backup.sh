#!/bin/bash

BACKUP_DIR="$HOME/automation/backups"
mkdir -p "$BACKUP_DIR"

if [ "$#" -lt 1 ]; then
    echo "Usage: $0 folder1 folder2 ..."
    exit 1
fi

TO_BACKUP="$@"

for folder in $TO_BACKUP; do
    if [ ! -d "$folder" ]; then
        echo "Folder does not exist: $folder"
        exit 1
    fi
done

DATE=$(date +"%Y-%m-%d_%H-%M-%S")
ARCHIVE_NAME="backup_$DATE.tar.gz"

tar -czf "$BACKUP_DIR/$ARCHIVE_NAME" $TO_BACKUP

echo "Backup created: $BACKUP_DIR/$ARCHIVE_NAME"
