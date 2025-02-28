#!/bin/bash

# Update system packages
sudo yum update -y

# Install required dependencies
sudo yum install -y git docker python3 python3-pip

# Install Docker Compose (manually for Amazon Linux 2023)
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# Start and enable Docker service
sudo systemctl start docker
sudo systemctl enable docker

# Add ec2-user to the Docker group (to allow running Docker without sudo)
sudo usermod -aG docker ec2-user

# Install Python dependencies
sudo python3 -m pip install --upgrade pip
sudo python3 -m pip install pytest
