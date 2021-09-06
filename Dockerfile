# DOCKER 
# ======

# Ubuntu LTS Release
FROM ubuntu:20.04

# Image Details
LABEL maintainer="Damien Barrett <damienbarrett@hotmail.com>"
LABEL version="0.1"
LABEL description="This is custom Docker image for personal development purposes."

# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive

# INSTALLATIONS/UPDATES
# =====================

# Update Ubuntu Software Repository
RUN apt update

# Install Ubuntu Packages
RUN apt install sudo
RUN sudo apt install -y zsh
RUN sudo apt install -y curl 
RUN sudo apt install -y git 
RUN sudo apt install -y wget 
RUN sudo apt install -y fonts-powerline 
RUN sudo apt install -y python 
RUN sudo apt install -y python3
RUN sudo apt install -y build-essential
RUN sudo apt install -y vim

# Install Node.js
RUN curl --silent --location https://deb.nodesource.com/setup_16.x | sudo bash -
RUN sudo apt install --yes nodejs

# Install Node.js Global Packages
RUN npm install --global npm@7.22.0
RUN npm install --global typescript@4.4.2

# Install Zsh and Plugins
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
# The following line is the 'manual' version not the ZSH version
# RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
# The following line is the ZSH version
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/themes/powerlevel10k

# CONFIGURATIONS
# ==============

# Configure Git
RUN wget https://github.com/damienbarrett/dev-container/raw/main/config/git/.gitconfig -O - > ~/.gitconfig

# Configure Zsh and Plugins
RUN wget https://github.com/damienbarrett/dev-container/raw/main/config/zsh/.zshrc -O - > ~/.zshrc
RUN wget https://github.com/damienbarrett/dev-container/raw/main/config/zsh/.p10k.zsh -O - > ~/.p10k.zsh

# Use ZSH as the default shell
CMD [ "zsh" ]
