#!/bin/bash

# Application log rotation script

LOG_DIR="./logs"
ARCHIVE_DIR="./log_archives"
RETENTION_DAYS=30

echo "===================================="
echo "          LOG ROTATION"
echo "===================================="

if [ ! -d "$LOG_DIR" ]; then
    echo "Error: Log directory does not exist."
    exit 1
fi

mkdir -p "$ARCHIVE_DIR"

timestamp=$(date +"%Y%m%d_%H%M%S")
archive_file="$ARCHIVE_DIR/logs_$timestamp.tar.gz"

echo "Creating log archive..."

if ! tar -czf "$archive_file" -C "$LOG_DIR" .; then
    echo "Error: Failed to create log archive."
    exit 1
fi

echo "Archive created: $archive_file"

echo ""
echo "Removing archives older than $RETENTION_DAYS days..."

find "$ARCHIVE_DIR" -type f \
    -name "logs_*.tar.gz" \
    -mtime +"$RETENTION_DAYS" -print -delete

echo ""
echo "Log rotation completed."
