# Update package list and install Zsh
sudo apt update -y
sudo apt install zsh -y

# Install Powerline fonts and Fira Code
sudo apt install fonts-powerline fonts-firacode -y

# Ensure locale is set to UTF-8
sudo apt-get install language-pack-en -y
sudo update-locale LANG=en_US.UTF-8