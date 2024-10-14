#!/bin/bash

get_cpu_platform() {
    uname -m
}

get_os_name() {
    uname -o
}

# Get the CPU platform and OS name
cpu_platform=$(get_cpu_platform)
os_name=$(get_os_name)

# Check if the platform is not aarch64 or the OS is not Android
if [[ "$cpu_platform" != "aarch64" || "$os_name" != "Android" ]]; then
    echo "Error: Platform not supported"
    exit 1
fi

# set storage permision
echo "TERMUX STARTUP"
termux-setup-storage
termux-change-repo
pkg update -y
pkg upgrade


# Install required packages
pkg install -y git wget curl nano openssh tmux zsh file which

chsh -s zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


# sh -c "$(curl -fsSL n.t00.uk)"