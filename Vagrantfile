# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_NO_PARALLEL'] = 'yes'

Vagrant.configure(2) do |config|
  NodeCount = 3
  NodeName = 'node'
  NodeNameDomaian = 'example.com'

  (1..NodeCount).each do |i|
    config.vm.define "#{NodeName}-#{i}" do |node|
    
      node.vm.box = "generic/ubuntu2004"
      node.vm.box_check_update = false
      # node.vm.box_version = "3.2.10"
      node.vm.hostname = "#{NodeName}-#{i}.#{NodeNameDomaian}"
      node.vm.network "private_network", ip: "172.16.16.10#{i}"
    
      node.vm.provider "virtualbox" do |v|
        v.name = "#{NodeName}-#{i}"
        v.memory = 2048
        v.cpus = 4
      end
      config.vm.synced_folder ".", "/vagrant", disabled: true
      config.vm.provision "shell", path: "bootstrap.sh" 
    end
  end
end
