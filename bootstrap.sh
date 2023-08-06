#!/bin/bash
sudo apt -y remove needrestart
sudo apt update
#innstall apache2
sudo apt -y install apache2 git rsync
#create index.html
sudo bash -c 'echo "bonpland app dev" > /var/www/html/index.html'
#install node
cd ~
curl -sL https://deb.nodesource.com/setup_16.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt -y install nodejs
# Create file .ssh
cd /home/ubuntu/.ssh
# Create and set permissions for the private SSH key file
sudo touch id_rsa
sudo echo "$SSH_PRIVATE_GIT_KEY" > id_rsa
sudo chmod 600 id_rsa
#install front Bonpland
mkdir /home/ubuntu/tmp
cd /home/ubuntu/tmp
git clone git@github.com:Inmobiliaria-Bonpland/frontend.git
cd /home/ubuntu/tmp/frontend
npm install
npm run build
sudo rsync -av /home/ubuntu/tmp/frontend/build/ /var/www/html/
