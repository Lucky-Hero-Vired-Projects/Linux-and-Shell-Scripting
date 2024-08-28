#!/bin/bash

# Define threshold for disk usage percentage
THRESHOLD=80

# Define email address of the system administrator
ADMIN_EMAIL="lakshminarayana.jonnala@gmail.com"

# Get the current disk usage percentage of the root filesystem
CURRENT_USAGE=$(df / | grep '/' | awk '{print $5}' | sed 's/%//')

# Check if the current usage is greater than or equal to the threshold
if [ "$CURRENT_USAGE" -ge "$THRESHOLD" ]; then
    # Prepare the alert message
    SUBJECT="Disk Usage Alert: Root Filesystem"
    MESSAGE="Warning: The root filesystem is ${CURRENT_USAGE}% full. Please take action."

    # Send the alert email using sendmail package
    echo "$MESSAGE" | mail -s "$SUBJECT" "$ADMIN_EMAIL"
fi
