#!/bin/bash

# Update package list and install Zsh
sudo apt update
sudo apt install -y zsh

# Change default shell to Zsh
chsh -s $(which zsh)

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Powerline fonts and Fira Code
sudo apt install -y fonts-powerline fonts-firacode

# Set Agnoster theme in .zshrc
sed -i 's/ZSH_THEME=".*"/ZSH_THEME="agnoster"/' ~/.zshrc

# Ensure locale is set to UTF-8
sudo apt-get install -y language-pack-en
sudo update-locale LANG=en_US.UTF-8

# Source .zshrc to apply changes
echo "source ~/.zshrc" | zsh

# Start a new Zsh session
exec zsh

echo "Zsh has been configured with the Agnoster theme and the shell has been restarted."
