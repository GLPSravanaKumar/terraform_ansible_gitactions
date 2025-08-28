#!/bin/bash
set -e

# Install dependencies
sudo apt update -y
sudo apt install -y apache2 unzip wget curl gnupg software-properties-common

#add new packages in this and taint the null_resource then do terraform apply
# taint command: powershell -Command "foreach ($i in 0..1) { terraform taint null_resource.configure_server[$i] } terraform apply
wget -O- https://apt.releases.hashicorp.com/gpg | \
  sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg --yes
# Add repo (idempotent: won't duplicate if already exists)
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" \
| sudo tee /etc/apt/sources.list.d/hashicorp.list > /dev/null
# Install terraform
sudo apt update -y
sudo apt install -y terraform


