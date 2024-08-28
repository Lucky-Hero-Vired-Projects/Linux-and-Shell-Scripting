#!/bin/bash

# Check if the file path is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <file_path>"
  exit 1
fi

# Get the file path from the argument
file_path="$1"

# Check if the file exists
if [ ! -e "$file_path" ]; then
  echo "File does not exist: $file_path"
  exit 1
fi

# Check read permission
if [ -r "$file_path" ]; then
  echo "You have read permission on $file_path"
else
  echo "You do not have read permission on $file_path"
fi

# Check write permission
if [ -w "$file_path" ]; then
  echo "You have write permission on $file_path"
else
  echo "You do not have write permission on $file_path"
fi

# Check execute permission
if [ -x "$file_path" ]; then
  echo "You have execute permission on $file_path"
else
  echo "You do not have execute permission on $file_path"
fi
