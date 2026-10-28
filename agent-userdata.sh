#!/bin/bash

#Install Java
sudo yum install java-21-amazon-corretto-headless -y

#Install Terraform
sudo yum install -y yum-utils shadow-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform

#Install Ansible
sudo yum install pip -y
pip install boto3
sudo yum install ansible  -y
python3 --version
pip show boto3

# Install Maven 
sudo yum install maven -y