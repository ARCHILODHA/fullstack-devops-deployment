#!/bin/bash

DATE=$(date +%F)

mongodump \
  --out /backups/mongodb_$DATE

echo "MongoDB Backup Completed"
