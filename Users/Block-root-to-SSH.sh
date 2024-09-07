#!/bin/bash

# Author: Noxcivis
# Github repo : https://github.com/Noxcivis
# Created on: 2021-08-15
# Last updated on: 2021-08-15
# Version: 1.0
# License: MIT
# Usage: bash allow-root-to-ssh.sh
# Description: This script enables root login via SSH by modifying the sshd_config file.
# Github link : https://github.com/Noxcivis/linux/blob/main/Users/Block-root-to-SSH.sh
# Tested on: Ubuntu 20.04 LTS
# Note: This script requires sudo privileges to run.
# Note: SSH public key authentication is recommended over password authentication.

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

  # Remove existing lines and add the new configurations
  sed -i '/^#PermitRootLogin/d' "$SSHD_CONFIG"
  sed -i '/^PermitRootLogin/d' "$SSHD_CONFIG"
  sed -i '/^#PubkeyAuthentication/d' "$SSHD_CONFIG"
  sed -i '/^PubkeyAuthentication/d' "$SSHD_CONFIG"
  sed -i '/^#PasswordAuthentication/d' "$SSHD_CONFIG"
  sed -i '/^PasswordAuthentication/d' "$SSHD_CONFIG"
  sed -i '/^#PermitEmptyPasswords/d' "$SSHD_CONFIG"
  sed -i '/^PermitEmptyPasswords/d' "$SSHD_CONFIG"
  sed -i '/^#AuthorizedKeysFile/d' "$SSHD_CONFIG"
  sed -i '/^AuthorizedKeysFile/d' "$SSHD_CONFIG"
  sed -i '/^# Noxcivis Modifications/d' "$SSHD_CONFIG"

  echo "" >> "$SSHD_CONFIG"
  echo "# Noxcivis Modifications" >> "$SSHD_CONFIG"
  echo "PermitRootLogin no" >> "$SSHD_CONFIG"
  echo "PubkeyAuthentication yes" >> "$SSHD_CONFIG"
  echo "PasswordAuthentication no" >> "$SSHD_CONFIG"
  echo "PermitEmptyPasswords no" >> "$SSHD_CONFIG"
  echo "AuthorizedKeysFile .ssh/authorized_keys" >> "$SSHD_CONFIG"

  # Restart the SSH service to apply changes
  systemctl restart sshd

  echo "Root login via SSH has been enabled."
}

# Main script execution
check_root
enable_root_login

echo "Script execution completed."
