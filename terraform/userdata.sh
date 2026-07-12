#!/bin/bash

set -e

# Update packages
apt update -y

# Install Java
apt install -y fontconfig openjdk-21-jre

# Install Git
apt install -y git

# Install Docker
apt install -y docker.io

systemctl enable docker
systemctl start docker

usermod -aG docker ubuntu

# Install utilities
apt install -y unzip curl

# Install AWS CLI v2
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

unzip awscliv2.zip

./aws/install

# Install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Install Helm
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# Install Jenkins
wget -O /usr/share/keyrings/jenkins-keyring.asc \
https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
https://pkg.jenkins.io/debian-stable binary/" \
> /etc/apt/sources.list.d/jenkins.list

apt update -y

apt install -y jenkins

# Give Jenkins Docker access
usermod -aG docker jenkins

# Enable services
systemctl enable docker
systemctl enable jenkins

systemctl restart docker
systemctl restart jenkins
