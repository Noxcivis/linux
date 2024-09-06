#!/bin/bash

# Author: Noxcivis
# Github repo : https://github.com/Noxcivis
# Created on: 2021-08-15
# Last updated on: 2021-08-15
# Version: 1.0
# License: MIT
# Usage: bash allow-root-to-ssh.sh
# Description: This script enables root login via SSH by modifying the sshd_config file.
# Github link : https://github.com/Noxcivis/linux/blob/main/Users/Allow-root-to-SSH.sh
# Tested on: Ubuntu 20.04 LTS
# Note: This script requires sudo privileges to run.
# Note: After running this script, it is recommended to disable root login via SSH for security reasons.
# Note: It is recommended to use SSH keys for authentication instead of passwords.
# Note: This script should be used with caution as enabling root login via SSH can pose security risks.
# Note: It is recommended to have a strong root password if root login via SSH is enabled.
# Note: This script assumes that the SSH service is running on the system.
# Note: USE THIS WITH CAUTION. ENABLING ROOT LOGIN VIA SSH CAN POSE SECURITY RISKS.

# Function to check if the script is run as root
check_root() {
  if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root. Use sudo to run it."
    exit 1
  fi
}

# Function to enable root login via SSH
enable_root_login() {
  SSHD_CONFIG="/etc/ssh/sshd_config"

  # Backup the original sshd_config file
  cp "$SSHD_CONFIG" "${SSHD_CONFIG}.bak"

  # Allow root login by modifying the sshd_config file
  sed -i 's/^#PermitRootLogin.*/PermitRootLogin yes/' "$SSHD_CONFIG"
  sed -i 's/^PermitRootLogin.*/PermitRootLogin yes/' "$SSHD_CONFIG"

  # Restart the SSH service to apply changes
  systemctl restart sshd

  echo "Root login via SSH has been enabled."
}

# Main script execution
check_root
enable_root_login

echo "Script execution completed."
