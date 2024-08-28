#!/bin/bash

# Check if a directory is provided as an argument
if [ -z "$1" ]; then
    echo "Usage: $0 <source_directory_path>"
    exit 1
fi

# Check if the provided argument is a directory
if [ ! -d "$1" ]; then
    echo "Error: $1 is not a valid directory."
    exit 1
fi

# Define the source directory and backup directory with a timestamp
SOURCE_DIR="$1"
TIMESTAMP=$(date +'%Y%m%d_%H%M%S')
BACKUP_DIR="${SOURCE_DIR}/backup_${TIMESTAMP}"

# Create the backup directory
mkdir -p "$BACKUP_DIR"

# Find and copy all .txt files to the backup directory
find "$SOURCE_DIR" -maxdepth 1 -type f -name "*.txt" -exec cp {} "$BACKUP_DIR" \;

echo "Backup of .txt files completed. Files are saved in $BACKUP_DIR"
