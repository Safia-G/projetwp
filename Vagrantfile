
Vagrant.configure("2") do |config|
config.vm.box = "ubuntu/xenial64"
config.vm.network "private_network", ip: "192.168.33.10"
config.vm.provision "shell", path: "scripts/auto-install.sh"
config.vm.synced_folder "./data", "/var/www/html", type: "virtualbox"end
