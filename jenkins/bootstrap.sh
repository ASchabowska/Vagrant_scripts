#!/bin/bash

#Install Java
echo "[TASK 1] Install Java"
sudo yum install java-1.8.0-openjdk-devel -y

#Import Jenkins repository
echo "[TASK 2] Import Jenkins repository"
curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo
sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key

#Install Jenkins
echo "[TASK 3] Install Jenkins"
sudo yum install jenkins -y
sudo systemctl start jenkins
systemctl status jenkins

#Enable Jenkins
echo "[TASK 4] Enable Jenkins"
sudo systemctl enable jenkins

echo "Installation completed!"