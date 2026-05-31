#!/bin/bash

BACKUP_DIR="./backup"
mkdir -p $BACKUP_DIR

tar -czf $BACKUP_DIR/project_backup_$(date +%F).tar.gz .
echo "Backup completed successfully."
