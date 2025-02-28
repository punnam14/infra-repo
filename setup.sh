#!/bin/bash

# Update system packages
sudo yum update -y

# Install required dependencies
sudo yum install -y git python3 python3-pip

sudo ln -s /usr/bin/python3 /usr/bin/python

# Install Python dependencies
sudo python3 -m pip install --upgrade pip

cd /home/ec2-user
git clone https://github.com/punnam14/hottake.git
cd hottake/backend

sudo python3 -m pip install -r requirements.txt
sudo python3 -m pip install pytest

# Ensure correct ownership & permissions
sudo chown -R ec2-user:ec2-user /home/ec2-user/hottake/backend
sudo chmod -R 775 /home/ec2-user/hottake/backend

# Ensure SQLite test database exists with correct permissions
sudo touch test.db
sudo chown ec2-user:ec2-user test.db
sudo chmod 666 test.db

# Ensure pytest cache directory has correct permissions
sudo mkdir -p .pytest_cache
sudo chmod -R 777 .pytest_cache