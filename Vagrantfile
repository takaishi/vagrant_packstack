# coding: utf-8
# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure(2) do |config|
  config.vm.box = "centos/7"
  
  config.vm.network "forwarded_port", guest: 80, host: 8080

  config.vm.synced_folder "./packstack_scripts", "/home/vagrant/packstack_scripts"
  config.vm.synced_folder ".", "/vagrant"

  config.vm.provider "virtualbox" do |vb|
    vb.cpus = 2
    vb.memory = 8192

    vb.customize ["modifyvm", :id, "--nic2","intnet"]
    vb.customize ["modifyvm", :id, "--nictype2","82540EM"]
    vb.customize ["modifyvm", :id, "--nicpromisc2","allow-all"]
    vb.customize ["modifyvm", :id, "--nat-network2", "intnet"]

    # NOTE:
    # $ VBoxManage natnetwork add --netname extnet --network 192.168.33.0/24
    vb.customize ["modifyvm", :id, "--nic3","natnetwork"]
    vb.customize ["modifyvm", :id, "--nictype3","82540EM"]
    vb.customize ["modifyvm", :id, "--nicpromisc3","allow-all"]  
    vb.customize ["modifyvm", :id, "--nat-network3", "extnet"]
  end
 
  config.vm.provision "shell", path: "provision.sh"
 
  config.vm.define 'controller' do |manage|
    manage.vm.hostname = 'controller'

    # OpenStack用のPrivateNetwork。Management用。172.16.0.0/24
    manage.vm.network :private_network, ip: "172.16.0.10", virtualbox__intnet: 'intnet'

    # OpenStack用のPublicNetwork.外部との通信用。192.168.33.0/24
    manage.vm.network :private_network, ip: "192.168.33.10"
  end
end
