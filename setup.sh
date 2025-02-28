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
