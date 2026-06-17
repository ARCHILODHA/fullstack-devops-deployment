#!/bin/bash

aws s3 sync /backups \
s3://my-backup-bucket

echo "S3 Sync Completed"
