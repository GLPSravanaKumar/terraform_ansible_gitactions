#!/bin/bash -xe
apt-get update -y
DEBIAN_FRONTEND=noninteractive apt-get upgrade -y
mkdir actions-runner && cd actions-runner
chown ubuntu:ubuntu /home/ubuntu/actions-runner
chown ubuntu:ubuntu /home/ubuntu/actions-runner/*
curl -o actions-runner-linux-x64-2.328.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.328.0/actions-runner-linux-x64-2.328.0.tar.gz
echo "01066fad3a2893e63e6ca880ae3a1fad5bf9329d60e77ee15f2b97c148c3cd4e  actions-runner-linux-x64-2.328.0.tar.gz" | shasum -a 256 -c
tar xzf ./actions-runner-linux-x64-2.328.0.tar.gz
./config.sh --url https://github.com/GLPSravanaKumar/terraform_ansible_gitactions --token BEFPW462XG4GFWWU3WE4IDTIU75E2
./svc.sh install
./svc.sh start

wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
