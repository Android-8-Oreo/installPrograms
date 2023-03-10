#!/bin/bash

# Prompt for confirmation
read -p "Are you sure you want to run this script? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi

# Detect OS
if [ -f /etc/debian_version ]; then
    SYSTEM_TYPE="debian"
elif [ -f /etc/arch-release ]; then
    SYSTEM_TYPE="arch"
elif [ -f /etc/fedora-release ]; then
    SYSTEM_TYPE="fedora"
else
    SYSTEM_TYPE="unknown"
fi

# Install programs
if [ "$SYSTEM_TYPE" = "debian" ]; then
    sudo apt-get update && sudo apt-get install htop nano neovim nmon nmtui py ipconfig clamav firefox alacritty xterm nemo wallch flameshot gimp kbackup libre bleachbit vlc cheese wine kdenlive -y
elif [ "$SYSTEM_TYPE" = "arch" ]; then
    sudo pacman -Syu htop nano neovim nmon nmtui py ipconfig clamav firefox alacritty xterm nemo wallch flameshot gimp kbackup libre bleachbit vlc cheese wine kdenlive --noconfirm
elif [ "$SYSTEM_TYPE" = "fedora" ]; then
    sudo dnf update && sudo dnf install htop nano neovim nmon nmtui py ipconfig clamav firefox alacritty xterm nemo wallch flameshot gimp kbackup libre bleachbit vlc cheese wine kdenlive -y
else
    echo "Unsupported OS. Exiting."
fi
