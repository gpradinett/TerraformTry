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
#install pokemon app
mkdir /home/ubuntu/tmp
cd /home/ubuntu/tmp
git clone https://github.com/Megh2507/Pokemon-App.git
cd /home/ubuntu/tmp/Pokemon-App
npm install
npm run build
sudo rsync -av /home/ubuntu/tmp/Pokemon-App/build/ /var/www/html/
