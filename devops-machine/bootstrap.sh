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
sudo usermod -aG docker $USER

#Install kubectl
echo "[TASK 3] Install kubectl"
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

#Install helm !!! cannot use snap fix it
echo "[TASK 4] Install Helm"
sudo apt-get install snapd -y
sudo snap install helm --classic -y

#Install ansible/puppet/chef
echo "[TASK 5] Install ansible"
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible -y
echo "[WARNING] further ansible configuration(ssh, hosts, authorized keys) will be needed"


echo "Installation completed!"

