#!/bin/bash

# Backup rotation script

BACKUP_DIR="./backups"
MAX_BACKUPS=5

echo "===================================="
echo "         BACKUP ROTATION"
echo "===================================="

if [ ! -d "$BACKUP_DIR" ]; then
    echo "Backup directory does not exist."
    exit 1
fi

echo "Backup directory: $BACKUP_DIR"
echo "Maximum backups to retain: $MAX_BACKUPS"

backup_count=$(find "$BACKUP_DIR" -maxdepth 1 -type f \
    -name "*.tar.gz" | wc -l)

echo "Current backup count: $backup_count"

if [ "$backup_count" -le "$MAX_BACKUPS" ]; then
    echo "No old backups need removal."
    exit 0
fi

remove_count=$((backup_count - MAX_BACKUPS))

echo "Removing $remove_count oldest backup(s)..."

find "$BACKUP_DIR" -maxdepth 1 -type f \
    -name "*.tar.gz" -printf '%T@ %p\n' |
    sort -n |
    head -n "$remove_count" |
    cut -d' ' -f2- |
    while IFS= read -r file; do
        echo "Removing: $file"
        rm -- "$file"
    done

echo "Backup rotation completed."
