#!/bin/bash

FONT_URI="https://github.com/ryanoasis/nerd-fonts/raw/refs/tags/v3.2.1/patched-fonts/3270/Regular/3270NerdFont-Regular.ttf"
ZSHRC_URI="https://raw.githubusercontent.com/tariqiitju/termux-init/refs/heads/dev/.zshrc"

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
pkg install -y git wget curl nano openssh tmux zsh file which oh-my-posh python

RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended


git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autocomplete
# Add plugins to .zshrc

# sh -c "$(curl -fsSL n.t00.uk)"


# replace with cascadiacove : better support
curl -L -o ~/.termux/font.ttf $FONT_URI

# eval "$(oh-my-posh init zsh --config )"

mv ~/.zshrc ~/.zshrc.bk
curl -L -o ~/.zshrc $ZSHRC_URI


termux-reload-settings
exec zsh -l