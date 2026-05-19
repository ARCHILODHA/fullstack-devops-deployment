#!/bin/bash

SOURCE="/home/user/data"
DEST="/backup/data"

rsync -avh --delete $SOURCE $DEST

echo "Backup completed successfully"
