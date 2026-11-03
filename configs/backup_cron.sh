#!/bin/bash

set -euo pipefail

# Database configuration
DB_NAME="${DB_NAME:-fullstack_db}"
DB_USER="${DB_USER:-root}"

BACKUP_DIR="${BACKUP_DIR:-/var/backups/mysql}"

DATE=$(date +"%Y-%m-%d_%H-%M-%S")

BACKUP_FILE="$BACKUP_DIR/${DB_NAME}_${DATE}.sql.gz"

# Create backup directory
mkdir -p "$BACKUP_DIR"

# Check required command
if ! command -v mysqldump >/dev/null 2>&1; then
    echo "Error: mysqldump is not installed."
    exit 1
fi

# Create compressed backup
mysqldump \
    --user="$DB_USER" \
    --password="$DB_PASSWORD" \
    "$DB_NAME" | gzip > "$BACKUP_FILE"

echo "Backup completed: $BACKUP_FILE"

# Delete backups older than 7 days
find "$BACKUP_DIR" \
    -type f \
    -name "*.sql.gz" \
    -mtime +7 \
    -delete

echo "Old backups cleaned successfully."
