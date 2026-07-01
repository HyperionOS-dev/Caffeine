#!/bin/bash
# Made by Hyperion
cat << 'EOF'
░█████╗░░█████╗░███████╗███████╗███████╗██╗███╗░░██╗███████╗
██╔══██╗██╔══██╗██╔════╝██╔════╝██╔════╝██║████╗░██║██╔════╝
██║░░╚═╝███████║█████╗░░█████╗░░█████╗░░██║██╔██╗██║█████╗░░
██║░░██╗██╔══██║██╔══╝░░██╔══╝░░██╔══╝░░██║██║╚████║██╔══╝░░
╚█████╔╝██║░░██║██║░░░░░██║░░░░░███████╗██║██║░╚███║███████╗
░╚════╝░╚═╝░░╚═╝╚═╝░░░░░╚═╝░░░░░╚══════╝╚═╝╚═╝░░╚══╝╚══════╝
EOF

cat << 'EOF'
── [ Systems Optimization Script ] ──────────────────────────────────
  > Target OS: Arch Linux
  > Created by: Hyperion
─────────────────────────────────────────────────────────────────────
EOF

echo "Getting Sudo Perms"
sudo echo
echo "Installing Required Packages"
sudo pacman -S --needed linux-tools
echo "Changing CPU governer to performance"
sudo cpupower frequency-set -g performance

echo "The performance governer has been set, however it'll be reset on rebooting incase of issues"

read -r -p "Would you like to make the governer change permanent? [Y/n]: " choice
case "$choice" in
	[yY]|[yY][eE][sS])
		echo "Making changes permanent"
		sudo mkdir -p /etc/default
		echo "governor='performance'" | sudo tee /etc/default/cpupower
		sudo systemctl enable --now cpupower.service

		echo "Changes are now permanent"
		;;
	[nN]|[nN][oO]|"")
		echo "The changes won't be permanent & the CPU governer will be reset upon restarting"
		;;
esac


