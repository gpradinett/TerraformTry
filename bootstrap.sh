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
#SSH ADD
touch ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa
echo "${{ secrets.SSH_PRIVATE_GIT_KEY }}" > ~/.ssh/id_rsa
#install front Bonpland
mkdir /home/ubuntu/tmp
cd /home/ubuntu/tmp
git clone git@github.com:Inmobiliaria-Bonpland/frontend.git
cd /home/ubuntu/tmp/frontend
npm install
npm run build
sudo rsync -av /home/ubuntu/tmp/frontend/build/ /var/www/html/
