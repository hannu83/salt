$tscript = <<TSCRIPT
sudo apt-get update
sudo apt-get -y install salt-minion
echo -e 'master: 142.93.160.134' | sudo tee /etc/salt/minion
sudo systemctl restart salt-minion
sudo apt-get -y install git
sudo git clone https://github.com/hannu83/salt.git

TSCRIPT

Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-18.04"
  config.vm.provision "shell", inline: $tscript

end

