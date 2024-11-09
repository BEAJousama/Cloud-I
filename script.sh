#!/bin/bash
# Initial setup script
apt-get update
apt-get install -y python3 python3-pip docker.io docker-compose
pip3 install ansible

# Install Digital Ocean CLI
wget https://github.com/digitalocean/doctl/releases/download/v1.101.0/doctl-1.101.0-linux-amd64.tar.gz
tar xf doctl-1.101.0-linux-amd64.tar.gz
mv doctl /usr/local/bin

# Add vagrant user to docker group
usermod -aG docker vagrant