#!/bin/bash
sudo apt -y remove needrestart
sudo apt update
#innstall apache2
sudo apt -y install apache2 git rsync
#create index.html
sudo bash -c 'echo "texto de prueba" > /var/www/html/index.html'
#install node
cd ~
curl -sL https://deb.nodesource.com/setup_16.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt -y install nodejs
# Crea archivo id_rsa
su - ubuntu -c "chmod 400 /home/ubuntu/.ssh/id_rsa"
# Add GitHub's public key to known_hosts
su - ubuntu -c "ssh-keyscan github.com >> /home/ubuntu/.ssh/known_hosts"
#install front Bonpland
su - ubuntu -c "mkdir /home/ubuntu/tmp && cd /home/ubuntu/tmp && git clone git@github.com:Inmobiliaria-Bonpland/frontend.git && cd frontend && git checkout dev && npm install && npm run build"
sudo rsync -av /home/ubuntu/tmp/frontend/dist/ /var/www/html/
