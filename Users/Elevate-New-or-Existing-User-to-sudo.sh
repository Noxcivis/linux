#!/bin/bash

# Author: Noxcivis
# Github repo : https://github.com/Noxcivis
# Created on: 2021-08-15
# Last updated on: 2021-08-15
# Version: 1.0
# License: MIT
# Usage: bash Elevate-New-or-Existing-User-to-sudo.sh
# Description: This script creates a new user or elevates an existing user to the 'sudo' group with full admin rights.
# Github link : https://github.com/Noxcivis/linux/blob/main/Users/Elevate-New-or-Existing-User-to-sudo.sh
# Tested on: Ubuntu 20.04 LTS
# Note: This script requires sudo privileges to run.

# Prompt for the username
read -p "Enter the username: " username

# Function to check if a user exists
user_exists() {
    id "$1" &>/dev/null
}

# Ensure the user exists
if user_exists "$username"; then
    echo "User '$username' already exists."
else
    echo "Creating user '$username'..."
    sudo useradd -m -s /bin/bash "$username"
    echo "User '$username' created."

    # Prompt for a password
    echo "Please enter a password for user '$username':"
    sudo passwd "$username"
fi

# Add the user to the "sudo" group
echo "Adding user '$username' to the 'sudo' group..."
sudo usermod -aG sudo "$username"

echo "User '$username' has been added to the 'sudo' group with full admin rights."
