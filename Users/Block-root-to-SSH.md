# IMPORTANT WARNING
Never run a `sudo` command and download a bash (or any other similar) script and automatically run it without checking the contents of the script file first.

# With SSH already installed
`sudo curl -s https://raw.githubusercontent.com/Noxcivis/linux/main/Users/Block-root-to-SSH.sh | sudo bash`

# SSH is required so installed it first
`sudo apt-get install -y openssh-server && sudo systemctl enable ssh && sudo systemctl start ssh && sudo curl -s https://raw.githubusercontent.com/Noxcivis/linux/main/Users/Block-root-to-SSH.sh | sudo bash`
