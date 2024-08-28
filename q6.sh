#!/bin/bash

# Defining variables
SOURCE_DIR="/home/user/documents"
BACKUP_DIR="/home/user/backup"
BACKUP_FILE="documents_backup.tar.gz"
TIMESTAMP=$(date +"%Y%m%d%H%M%S")

# Create a timestamped backup file name
BACKUP_FILE_TIMESTAMP="${BACKUP_DIR}/documents_backup_${TIMESTAMP}.tar.gz"

# Create backup
echo "Starting backup of $SOURCE_DIR to $BACKUP_FILE_TIMESTAMP..."
tar -cvzf "$BACKUP_FILE_TIMESTAMP" "$SOURCE_DIR" .

# Check if the backup was successful
if [ $? -eq 0 ]; then
  echo "Backup successful: $BACKUP_FILE_TIMESTAMP"
else
  echo "Backup failed"
fi

cp $BACKUP_FILE_TIMESTAMP $BACKUP_DIR



############################

## Cronjob for this script for 24hrs

#0 1 * * * /home/user/backup_documents.sh
