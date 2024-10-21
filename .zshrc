
#33______________________PATH__________________________33
# PATH=$PATH:$HOME/.local/bin
#33____________________________________________________33



export ZSH="$HOME/.oh-my-zsh"

plugins=(
    git
    aliases
    # ansible
    # gh
    # git-auto-fetch
    # direnv
    # nvm
    # mvn
    # npm
    # node
    # aws
    # docker
    # docker-compose
    # kubectl
    # vscode
    python
    pip
    tmux
    ssh
    # spring
    # thefuck
    fast-syntax-highlighting
    zsh-autosuggestions
    zsh-autocomplete
    zsh-history-substring-search
)


source $ZSH/oh-my-zsh.sh

# change history search on the fly
zle -A {.,}history-incremental-search-forward
zle -A {.,}history-incremental-search-backward

# Menu style autocomplete
zstyle ':autocomplete:*' widget-style menu-select

# Hit enter to select suggesion from autocomplete menu natigation
bindkey -M menuselect '\r' accept-line
# show 10 lines of suggesion at once
zstyle ':autocomplete:*' list-lines 10

zstyle ':completion:*' menu select=long

# Disable automatic selection of the first item in autocomplete [changed to default]
bindkey '^I' expand-or-complete


# Custom keybindings for navigating the suggestion menu
bindkey '^n' menu-select
bindkey '^p' reverse-menu-select


# change arrow keys to default behave
bindkey '\e[A' history-beginning-search-backward
bindkey '\eOA' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward
bindkey '\eOB' history-beginning-search-forward

# navigate history string match
bindkey '^[[1;2A' history-substring-search-up
bindkey '^[[1;2B' history-substring-search-down


#Experimental config



# load ohmyposh
eval "$(oh-my-posh init zsh --config 'https://raw.githubusercontent.com/tariqiitju/termux-init/refs/heads/dev/sundari.omp.toml')"
