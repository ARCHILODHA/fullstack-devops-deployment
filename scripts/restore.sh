#!/bin/bash

BACKUP_FILE=$1

if [ -f "$BACKUP_FILE" ]; then
    tar -xzf $BACKUP_FILE
    echo "Restore completed."
else
    echo "Backup file not found."
fi
