#!/bin/bash

function install_essentials {
  sudo apt-get install -y \
    build-essential \
    git \
    vim \
    curl
}

function install_docker {
  # Allow apt to use repos over HTTPS
  sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

  # Add docker's official GPG key
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  sudo apt-key fingerprint 0EBFCD88

  # Add docker stable repo
  sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

  sudo apt-get update
  sudo apt-get install -y docker-ce
}

function install_docker_compose {
  sudo curl -L \
    "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" \
    -o /usr/local/bin/docker-compose

  sudo chmod +x /usr/local/bin/docker-compose

  # Add docker-compose bash completion
  sudo curl -L \
    https://raw.githubusercontent.com/docker/compose/1.23.1/contrib/completion/bash/docker-compose \
    -o /etc/bash_completion.d/docker-compose
}

install_essentials
install_docker
install_docker_compose
