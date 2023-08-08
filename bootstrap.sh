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
#sudo touch /home/ubuntu/.ssh/id_rsa
#echo "${{ secrets.SSH_PRIVATE_GIT_KEY }}" > /home/ubuntu/.ssh/id_rsa
#echo "holaaa" > /home/ubuntu/.ssh/prueba
# echo -n "${{ secrets.SSH_PRIVATE_GIT_KEY }}" | sudo tee /home/ubuntu/.ssh/id_rsa >/dev/null
#echo "${{ secrets.SSH_PRIVATE_GIT_KEY }}" > /home/ubuntu/.ssh/id_rsa
sudo chmod 600 /home/ubuntu/.ssh/id_rsa
sudo chown ubuntu:ubuntu /home/ubuntu/.ssh/id_rsa
# Add GitHub's public key to known_hosts
ssh-keyscan github.com >> /home/ubuntu/.ssh/known_hosts
sudo chown ubuntu:ubuntu /home/ubuntu/.ssh/known_hosts
#install front Bonpland
mkdir /home/ubuntu/tmp
cd /home/ubuntu/tmp
git clone git@github.com:Inmobiliaria-Bonpland/frontend.git
cd /home/ubuntu/tmp/frontend
npm install
npm run build
sudo rsync -av /home/ubuntu/tmp/frontend/build/ /var/www/html/
