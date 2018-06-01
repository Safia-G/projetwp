
sudo apt-get update
sudo apt-get install -y apache2 php7.0 libapache2-mod-php7.0 cmatrix vim
export UBUNTU_FRONTEND="noninteractive"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password 0000";
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password 0000";
sudo apt-get install -y mysql-server;
sudo apt-get install php7.0-mysql;
mysql_secure_installation;
sudo service apache2 restart; 
