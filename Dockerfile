FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    curl git zsh  sudo nano \
    python3 python3-pip \
    zip tmux fontconfig locales \
    && apt-get clean
ENV LOCAL_USER=tariq
# Create user
RUN useradd -m -s /bin/bash ${LOCAL_USER} \
    && echo "${LOCAL_USER} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER ${LOCAL_USER}
ENV USER_HOME=/home/${LOCAL_USER}
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
ENV TERM=xterm-256color

# Set locale and other environment variables
RUN sudo locale-gen en_US.UTF-8

# Download and install FiraCode Nerd Font
RUN sudo mkdir -p /usr/share/fonts/nerd-fonts && \
    sudo curl -fLo "/usr/share/fonts/nerd-fonts/MesloLGS-NF-Regular.ttf" \
    "https://raw.githubusercontent.com/romkatv/dotfiles-public/refs/heads/master/.local/share/fonts/NerdFonts/MesloLGS%20NF%20Regular.ttf" && \
    sudo fc-cache -fv

WORKDIR ${USER_HOME}

RUN mkdir -p ${USER_HOME}/.local/bin themes
RUN mkdir Downloads Doccuments Code Projetcs Pictures Videos Media

COPY test_omz.sh ${USER_HOME}/
COPY .zsh_history ${USER_HOME}/
COPY .zshrc ${USER_HOME}/.zshrc.pre
COPY sundari.omp.toml ${USER_HOME}/themes/

RUN sudo chown -R ${LOCAL_USER}:${LOCAL_USER} ${USER_HOME}

RUN sudo chmod +x ${USER_HOME}/test_omz.sh



