#!/bin/bash

# install dependencies
yum -y group install "Development Tools"
yum -y install \
        bzip2-devel.x86_64 \
        java-11-amazon-corretto-headless \
        libffi-devel \
        ncurses-devel \
        openssl-devel \
        python3 \
        readline-devel.x86_64 \
        sqlite-devel.x86_64 \
        zlib-devel

# Install Node.js
curl -sL https://rpm.nodesource.com/setup_14.x | sudo bash -
sudo yum install -y nodejs
# Install PNPM
sudo npm install -g pnpm

# install the elastic beanstalk CLI
curl -O https://bootstrap.pypa.io/get-pip.py
/usr/bin/python3 get-pip.py
/usr/local/bin/pip3 install awsebcli
# Install S3 CLI (s3cmd)
sudo yum install -y s3cmd
# Install aws cli v2
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install