#!/bin/bash
sudo apt update -y
sudo apt install docker.io -y
sudo apt install docker-compose -y
sudo systemctl start docker
sudo systemctl enable docker