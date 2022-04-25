# DOCKER 
# ======

# Ubuntu LTS Release
FROM ubuntu:20.04

# Image Details
LABEL maintainer="Damien Barrett <damienbarrett@hotmail.com>"
LABEL version="2.0.0"
LABEL description="This is custom Docker image for personal development purposes."

# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive

# INSTALLATIONS/UPDATES
# =====================

# Update Ubuntu Software Repository and Install Core Packages
RUN apt update && \
    apt install --yes \
        sudo \
        curl

# Update Node.js Repository
RUN curl --silent --location https://deb.nodesource.com/setup_16.x | sudo bash - 


# Install Ubuntu Packages
ARG DEBIAN_FRONTEND=noninteractive
RUN sudo apt-get install --yes \
    zsh \
    git \
    wget \
    fonts-powerline \
    python \
    python3 \
    build-essential \
    vim \
    nodejs

# Install Go
RUN apt-get --yes install --no-install-recommends golang-go

# Install PostgreSQL

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get install --yes \
    postgresql \
    postgresql-client \
    postgresql-contrib

# Install Node.js Global Packages
RUN npm install --global npm@7.22.0 \
    typescript@4.4.2 \
    yarn@1.22.11

# Install Zsh and Plugins
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/themes/powerlevel10k

# GitHub Command Line
RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
RUN sudo apt update && sudo apt install gh

# CONFIGURATIONS
# ==============

# Configure Git
RUN wget https://github.com/damienbarrett/dev-container/raw/main/config/git/.gitconfig -O - > ~/.gitconfig

# Configure Zsh and Plugins
RUN wget https://github.com/damienbarrett/dev-container/raw/main/config/zsh/.zshrc -O - > ~/.zshrc
RUN wget https://github.com/damienbarrett/dev-container/raw/main/config/zsh/.p10k.zsh -O - > ~/.p10k.zsh

# Configure PostgreSQL
# https://docs.docker.com/samples/postgresql_service/
USER postgres
RUN  /etc/init.d/postgresql start &&\
    psql --command "CREATE USER docker WITH SUPERUSER PASSWORD 'docker';" &&\
    createdb -O docker docker
RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/12/main/pg_hba.conf
RUN echo "listen_addresses='*'" >> /etc/postgresql/12/main/postgresql.conf
USER root
RUN echo "sudo -u postgres /usr/lib/postgresql/12/bin/postgres -D /var/lib/postgresql/12/main -c config_file=/etc/postgresql/12/main/postgresql.conf &" >> /start-postgres.sh
RUN chmod +x /start-postgres.sh
RUN echo "sudo -u postgres psql" >> /start-psql.sh
RUN chmod +x /start-psql.sh

EXPOSE 5432

# Use ZSH as the default shell
CMD [ "zsh" ]