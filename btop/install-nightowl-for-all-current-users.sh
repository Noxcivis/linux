#!/bin/bash

# Path to the configuration file on GitHub
CONFIG_URL="https://raw.githubusercontent.com/Noxcivis/linux/main/btop/nightowl.conf"

# Loop through each user profile
for user_home in /home/*; do
    # Ensure the btop config directory exists
    mkdir -p "$user_home/.config/btop"
    
    # Download the configuration file
    curl -o "$user_home/.config/btop/btop.conf" $CONFIG_URL
done

# Also handle the root user
mkdir -p /root/.config/btop
curl -o /root/.config/btop/btop.conf $CONFIG_URL
