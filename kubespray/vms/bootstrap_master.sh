#!/bin/bash

sudo yum check-update

# Set firewall rules
echo "---------------------------"
echo "[TASK 1] Set firewall rules"
echo "---------------------------"
sudo systemctl enable firewalld
sudo systemctl start firewalld
sudo firewall-cmd --permanent --add-port=6443/tcp 
sudo firewall-cmd --permanent --add-port=2379-2380/tcp 
sudo firewall-cmd --permanent --add-port=10250/tcp 
sudo firewall-cmd --permanent --add-port=10251/tcp 
sudo firewall-cmd --permanent --add-port=10252/tcp 
sudo firewall-cmd --permanent --add-port=10255/tcp 
sudo firewall-cmd --reload 
sudo modprobe br_netfilter 
sudo sysctl -w net.ipv4.ip_forward=1

# Install git
echo "---------------------------"
echo "[TASK 2] Install git"
echo "---------------------------"
sudo yum -y install git

# Clone repository
echo "---------------------------"
echo "[TASK 3] Clone repository"
echo "---------------------------"
sudo git clone https://github.com/kubernetes-sigs/kubespray

# Install dependencies
echo "---------------------------"
echo "[TASK 4] Install dependencies"
echo "---------------------------"
sudo yum -y install python-pip
cd kubespray
sudo pip install -r requirements.txt

# Prepare workspace
echo "---------------------------"
echo "[TASK 5] Prepare workspace"
echo "---------------------------"
mv ./inventory/sample ./inventory/cluster

echo "---------------------------"
echo "FURTHER CONFIGURATION NEEDED!!"
echo "SETUP SSH CONNECTIONS"
echo "---------------------------"



     