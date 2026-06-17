#!/bin/bash

DATE=$(date +%F)

pg_dump -U postgres mydb \
> /backups/postgres_$DATE.sql

echo "PostgreSQL Backup Completed"
