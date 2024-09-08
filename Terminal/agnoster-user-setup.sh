#!/bin/bash

# Author: Noxcivis
# Github repo : https://github.com/Noxcivis
# Created on: 2021-08-15
# Last updated on: 2021-08-15
# Version: 1.0
# License: MIT
# Usage: bash agnoster.sh
# Description: This script configures the Zsh shell with the Agnoster theme and restarts the shell.
# Github link : https://github.com/Noxcivis/linux/blob/main/Terminal/agnoster.sh
# Tested on: Ubuntu 20.04 LTS
# Note: This script requires curl to be installed on the system. If it is not installed, run 'sudo apt install curl -y' before running this script.
# Note: This script requires the user to enter their password to install Zsh and change the default shell.


rm -fr ~/.oh-my-zsh

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Set Agnoster theme in .zshrc
sed -i 's/ZSH_THEME=".*"/ZSH_THEME="agnoster"/' ~/.zshrc

# Source .zshrc to apply changes
echo "source ~/.zshrc" | zsh

# Change default shell to Zsh
chsh -s $(which zsh)

# Start a new Zsh session
exec zsh

# Print success message
echo "Zsh has been configured with the Agnoster theme and the shell has been restarted."
