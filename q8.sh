#!/bin/bash

# Check if a file path is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <file_path>"
  exit 1
fi

# Get the file path from the argument
file_path="$1"

# Check if the file exists
if [ ! -f "$file_path" ]; then
  echo "File does not exist: $file_path"
  exit 1
fi

# Count lines, words, and characters
line_count=$(wc -l < "$file_path")
word_count=$(wc -w < "$file_path")
char_count=$(wc -m < "$file_path")

# Display the counts
echo "File: $file_path"
echo "Lines: $line_count"
echo "Words: $word_count"
echo "Characters: $char_count"
