#!/bin/bash

DB_NAME="mydatabase"
USER="root"
PASSWORD="password"

mysqldump -u $USER -p$PASSWORD $DB_NAME > backup.sql

echo "MySQL backup created"
