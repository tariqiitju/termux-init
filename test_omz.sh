#!/bin/bash


RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 


git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# Add plugins to .zshrc

sed -i 's/plugins=(git)/plugins=(git zsh-syntax-highlighting zsh-history-substring-search zsh-autosuggestions)/' ~/.zshrc

# sh -c "$(curl -fsSL n.t00.uk)"


curl -L -o ~/ttffont.ttf "https://raw.githubusercontent.com/romkatv/dotfiles-public/refs/heads/master/.local/share/fonts/NerdFonts/MesloLGS%20NF%20Regular.ttf"

exec zsh -l