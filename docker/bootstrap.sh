#!/bin/bash

sudo apt-get update 

#Install git
echo "[TASK 1] Install git"
sudo apt-get install git -y

#Install docker
echo "[TASK 2] Install docker"
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent -y \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update 
sudo apt-get install docker-ce -y
sudo usermod -aG docker vagrant

echo "Installation completed!"

