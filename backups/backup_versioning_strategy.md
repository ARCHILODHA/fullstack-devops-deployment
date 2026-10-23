

# Backup Versioning Strategy

## Overview
Backup versioning preserves multiple versions of files and datasets. It allows administrators to recover earlier versions after accidental deletion, corruption, or unwanted modifications.

## Versioning Approaches
- Timestamp-based backup filenames.
- Incremental backup versions.
- Snapshot-based versioning.
- Object storage versioning.
- Application-level version management.

## Example

```bash
#!/bin/bash

SOURCE="/var/www/html"
BACKUP_DIR="/var/backups/website"
TIMESTAMP=$(date '+%Y%m%d_%H%M%S')
ARCHIVE="$BACKUP_DIR/website_$TIMESTAMP.tar.gz"

if [[ ! -d "$SOURCE" ]]; then
    echo "ERROR: Source directory does not exist"
    exit 1
fi

mkdir -p "$BACKUP_DIR"

if tar -czf "$ARCHIVE" -C "$SOURCE" .; then
    echo "Backup created: $ARCHIVE"
else
    echo "ERROR: Backup creation failed"
    rm -f "$ARCHIVE"
    exit 1
fi
