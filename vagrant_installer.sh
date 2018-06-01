#!/usr/bin/env bash

#Vagrantfile configuration
echo "
Vagrant.configure(\"2\") do |config|
config.vm.box = \"ubuntu/xenial64\"
config.vm.network \"private_network\", ip: \"192.168.33.10\"
config.vm.provision \"shell\", path: \"scripts/auto-install.sh\"
config.vm.synced_folder \"./data\", \"/var/www/html\", type: \"virtualbox\"end" > Vagrantfile;
# Folders & file creation
mkdir data;
mkdir scripts;
touch ./scripts/auto-install.sh;

# File moving
mv wp_installer.sh ./data

# auto-install.sh configuration
echo "
sudo apt-get update
sudo apt-get install -y apache2 php7.0 libapache2-mod-php7.0 cmatrix vim
export UBUNTU_FRONTEND=\"noninteractive\"
sudo debconf-set-selections <<< \"mysql-server mysql-server/root_password password 0000\";
sudo debconf-set-selections <<< \"mysql-server mysql-server/root_password_again password 0000\";
sudo apt-get install -y mysql-server;
sudo apt-get install php7.0-mysql;
mysql_secure_installation;
sudo service apache2 restart; " > ./scripts/auto-install.sh;

vagrant up
vagrant ssh