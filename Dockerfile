FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    curl git zsh  sudo\
    && apt-get clean
ENV LOCAL_USER=tariq
# Create user
RUN useradd -m -s /bin/bash ${LOCAL_USER} \
    && echo "${LOCAL_USER} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER ${LOCAL_USER}
