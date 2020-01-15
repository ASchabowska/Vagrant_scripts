#!/bin/bash

sudo yum check-update

# Disable SELinux
echo "---------------------------"
echo "[TASK 1] disable SELinux"
echo "---------------------------"
sudo sed -i --follow-symlinks 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux

# Install Ansible
echo "---------------------------"
echo "[TASK 2] Install Ansible"
echo "---------------------------"
sudo yum -y install epel-release \
                    ansible

# Generate ssh key
echo "---------------------------"
echo "[TASK 3] Generate ssh key"
echo "---------------------------"
ssh-keygen -t rsa



