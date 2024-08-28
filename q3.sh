#!/bin/bash

# Get the username
USERNAME=$(whoami)

# Get the user ID and group ID using the id command
USER_ID=$(id -u)
GROUP_ID=$(id -g)

# Get the home directory and shell from environment variables
HOME_DIR=$HOME
SHELL_USED=$SHELL

# Display the user information
echo "User Information:"
echo "-----------------"
echo "Username     : $USERNAME"
echo "User ID      : $USER_ID"
echo "Group ID     : $GROUP_ID"
echo "Home Directory: $HOME_DIR"
echo "Shell        : $SHELL_USED"
