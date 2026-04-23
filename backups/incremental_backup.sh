#!/bin/bash

SOURCE="/data"
DEST="/backup"

rsync -av --delete $SOURCE $DEST

echo "Incremental backup completed"
