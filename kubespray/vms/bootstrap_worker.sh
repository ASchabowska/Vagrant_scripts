#!/bin/bash

sudo yum check-update

# Set firewall rules
echo "---------------------------"
echo "[TASK 1] Set firewall rules"
echo "---------------------------"
sudo systemctl enable firewalld
sudo systemctl start firewalld
sudo firewall-cmd --permanent --add-port=10250/tcp 
sudo firewall-cmd --permanent --add-port=10255/tcp 
sudo firewall-cmd --permanent --add-port=30000-32767/tcp
sudo firewall-cmd --permanent --add-port=6783/tcp 
sudo firewall-cmd  --reload 
sudo sysctl -w net.ipv4.ip_forward=1

echo "---------------------------"
echo "FURTHER CONFIGURATION NEEDED!!"
echo "SETUP SSH CONNECTIONS"
echo "---------------------------"