#!/bin/bash
RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# candidate zsh-autocomplete : research -- no command history but tab auto complete (files/folder man/ next command)

git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autocomplete

# oh my posh setup

curl -s https://ohmyposh.dev/install.sh | bash -s -- -d $HOME/.local/bin


mv $HOME/.zshrc $HOME/.zshrc.bk
mv $HOME/.zshrc.pre $HOME/.zshrc
# pip install thefuck


exec zsh -l

# https://timjames.dev/blog/overhaul-your-terminal-with-zsh-plugins-more-3oag -- note