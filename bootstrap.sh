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
# Debug: Mostrar el contenido del secreto antes de copiarlo
echo "Contenido del secreto antes de copiar:"
echo "${{ secrets.SSH_PRIVATE_GIT_KEY }}"
# sudo mkdir -p /home/ubuntu/.ssh
sudo touch /home/ubuntu/.ssh/id_rsa
sudo touch /home/ubuntu/.ssh/prueba
echo -n "holaaa" > /home/ubuntu/.ssh/prueba
# echo -n "${{ secrets.SSH_PRIVATE_GIT_KEY }}" | sudo tee /home/ubuntu/.ssh/id_rsa >/dev/null
echo -n "-----BEGIN OPENSSH PRIVATE KEY-----
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
-----END OPENSSH PRIVATE KEY-----" > /home/ubuntu/.ssh/id_rsa
# sudo chmod 600 /home/ubuntu/.ssh/id_rsa
#install front Bonpland
mkdir /home/ubuntu/tmp
cd /home/ubuntu/tmp
git clone git@github.com:Inmobiliaria-Bonpland/frontend.git
cd /home/ubuntu/tmp/frontend
npm install
npm run build
sudo rsync -av /home/ubuntu/tmp/frontend/build/ /var/www/html/
