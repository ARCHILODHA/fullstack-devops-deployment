#!/bin/bash

echo "Taking DB backup..."
mysqldump -u root -p db_name > backup.sql

echo "Backup completed"
