# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define "fbbuild" do |fbbuild|
    fbbuild.vm.hostname = "fbbuild.blakesmith.me"
    fbbuild.vm.box = "ubuntu/trusty64"
    fbbuild.vm.network "private_network", ip: "192.168.50.9"
    fbbuild.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.memory = 3192
    end
    fbbuild.vm.provision "puppet" do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.module_path = "puppet/modules"
      puppet.manifest_file  = "fbbuild.pp"
    end
  end
end
