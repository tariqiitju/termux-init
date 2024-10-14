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
pkg install -y git wget curl nano openssh tmux zsh file which oh-my-posh

chsh -s zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


exec zsh <<'EOF'
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# Add plugins to .zshrc

EOF
sed -i 's/plugins=(git)/plugins=(git zsh-syntax-highlighting zsh-history-substring-search zsh-autosuggestions)/' ~/.zshrc

# sh -c "$(curl -fsSL n.t00.uk)"


curl -L -o ~/.termux/font.ttf "https://raw.githubusercontent.com/romkatv/dotfiles-public/refs/heads/master/.local/share/fonts/NerdFonts/MesloLGS%20NF%20Regular.ttf"

termux-reload-settings
exec zsh -l