# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|

  config.vm.box       = "centos/7"
  config.vm.host_name = "vpnserver.vm"
  config.vm.define    :vpnserver

#  config.vm.network "private_network", ip: "192.168.10.10"
#  config.vm.network "forwarded_port", guest: 80, host: 8084

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 512
    vb.cpus   = 1
  end

  config.vm.provider "digital_ocean" do |digocn, override|
    override.ssh.private_key_path = "~/.ssh/digital_ocean"

    digocn.token  = ENV['TOKEN']
    digocn.image  = "centos-7-0-x64"
    digocn.region = "lon1"
  end

  # Install Puppet onto guest box using Shell Provisioner
  config.vm.provision "shell", path: "centos_7_x.sh"

  # Puppet Shared Folder
  # See https://github.com/mitchellh/vagrant/issues/6154 for why we do this.
  config.vm.synced_folder ".", "/home/vagrant/sync", disabled: true
  config.vm.synced_folder "puppet", "/puppet"

  # Puppet Provisioner setup
  config.vm.provision "puppet" do |puppet|
    puppet.hiera_config_path = "puppet/hiera.yaml"
    puppet.manifests_path    = "puppet/manifests"
    puppet.module_path       = "puppet/modules"
    puppet.manifest_file     = "site.pp"
    #puppet.options          = "--verbose, --debug"
  end

end
