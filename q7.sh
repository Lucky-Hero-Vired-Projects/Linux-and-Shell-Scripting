#!/bin/bash

# Define variables
PROCESS_NAME="apache2"
LOG_FILE="/var/log/apache.log"

# Check if the process is running
if pgrep "$PROCESS_NAME" > /dev/null; then
  echo "$(date): $PROCESS_NAME is running." >> "$LOG_FILE"
else
  echo "$(date): $PROCESS_NAME is not running" >> "$LOG_FILE"
  
  # Start the process
  if systemctl start "$PROCESS_NAME"; then
    echo "$(date): Successfully started $PROCESS_NAME." >> "$LOG_FILE"
  else
    echo "$(date): Failed to start $PROCESS_NAME." >> "$LOG_FILE"
  fi
fi
