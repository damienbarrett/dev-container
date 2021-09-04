# Download Ubuntu LTS release
FROM ubuntu:20.04

# Details about this image
LABEL maintainer="Damien Barrett <damienbarrett@hotmail.com>"
LABEL version="0.1"
LABEL description="This is custom Docker image for personal development purposes."

# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive

# Update Ubuntu Software repository
RUN apt update

# Update Ubuntu Packages
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
RUN curl --silent --location https://deb.nodesource.com/setup_16.x | sudo bash -
RUN sudo apt install --yes nodejs

# Configure Zsh / Oh My Zsh / PowerLevel10K
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

# Setup Node / TypeScript Environment
RUN npm install --global npm@7.22.0
RUN npm install --global typescript@4.4.2

# Configure Git
COPY ./config/git/.gitconfig /root/.gitconfig

RUN wget https://github.com/damienbarrett/dev-container/raw/main/config/zsh/.zshrc -O - > ~/.zshrc
RUN wget https://github.com/damienbarrett/dev-container/raw/main/config/zsh/.p10k.zsh -O - > ~/.p10k.zsh

# Use KSH as the default shell
CMD [ "zsh" ]
