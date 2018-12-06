#!/bin/bash

function install_essentials {
  sudo apt-get install -y \
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

install_essentials
install_docker
