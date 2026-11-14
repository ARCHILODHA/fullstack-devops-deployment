#!/bin/bash

# MySQL database backup script

DB_NAME="${1:-}"
BACKUP_DIR="./database_backups"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

echo "===================================="
echo "        DATABASE BACKUP"
echo "===================================="

if [ -z "$DB_NAME" ]; then
    echo "Usage: ./database_backup.sh database_name"
    exit 1
fi

if ! command -v mysqldump &>/dev/null; then
    echo "Error: mysqldump is not installed."
    exit 1
fi

mkdir -p "$BACKUP_DIR"

BACKUP_FILE="$BACKUP_DIR/${DB_NAME}_${TIMESTAMP}.sql.gz"

echo "Database: $DB_NAME"
echo "Backup location: $BACKUP_FILE"

echo ""
echo "Creating database backup..."

if mysqldump --user="${DB_USER:-root}" \
    --password \
    --single-transaction \
    --routines \
    --triggers \
    "$DB_NAME" | gzip > "$BACKUP_FILE"; then

    if [ -s "$BACKUP_FILE" ]; then
        echo ""
        echo "Database backup created successfully."
        echo "File size: $(du -h "$BACKUP_FILE" | cut -f1)"
    else
        echo "Error: Backup file is empty."
        rm -f "$BACKUP_FILE"
        exit 1
    fi

else
    echo "Error: Database backup failed."
    rm -f "$BACKUP_FILE"
    exit 1
fi
