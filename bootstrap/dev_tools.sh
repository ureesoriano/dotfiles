#!/bin/bash

function install_essentials {
  sudo apt-get install -y \
    build-essential \
    git \
    vim \
    tree \
    net-tools \
    wine-stable \
    curl \
    openvpn
}

function install_node {
  sudo apt-get install -y \
    nodejs \
    npm
}

function vim_setup {
  # Install Plug
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  # Install kraihlight color scheme
  mkdir ~/.vim/colors/
  curl -L https://gist.githubusercontent.com/kraih/1711014/raw/719f65ac7d3f3886261ad6cc609560fa9cf23cdf/kraihlight.vim \
    -o ~/.vim/colors/kraihlight.vim

  # Install powerline
  sudo apt-get install -y python3-pip
  pip3 install powerline-status

  # Fonts: D2coding font & Ubuntu mono for powerline
  mkdir ~/.fonts
  curl -L \
    https://raw.githubusercontent.com/naver/d2codingfont/master/D2Coding-Ver1.3.2-20180524.zip \
    -o d2coding.zip
  unzip d2coding.zip -d ~/.fonts/
  mkdir ~/.fonts/Ubuntu_mono_powerline/
  curl -L \
    https://raw.githubusercontent.com/powerline/fonts/master/UbuntuMono/Ubuntu%20Mono%20derivative%20Powerline.ttf \
    -o ~/.fonts/Ubuntu_mono_powerline/Ubuntu_Mono_derivative_Powerline.ttf

  # Install YouCompleteMe
  sudo apt install -y \
    build-essential \
    cmake \
    python3-dev
  sudo npm i -g typescript
  cd ~/.vim/plugged/YouCompleteMe
  python3 install.py --ts-completer
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
install_node
vim_setup
install_docker
install_docker_compose
