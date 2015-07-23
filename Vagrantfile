# -*- mode: ruby -*-
# vi: set ft=ruby :

#
# A basic cluster (3 nodes acting as slaves, masters and zookeeper) with Zookeeper, Mesos, Marathon and Docker.
# There is also a docker registry and a Qubit's Bamboo, a squid server for caching the RPMs, and all of this 
# software should be configured to work together.
# One should put a ssh public key inside the ./keys folder before running this file.

$bootstrap_script = <<SCRIPT
sudo cat /vagrant/keys/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
SCRIPT

Vagrant.configure("2") do |config|

  config.vm.box = "boxcutter/centos71"
  config.vm.synced_folder ".", "/vagrant", id: "centos", type: "rsync"

  # Cache proxy, Docker registry and ansible box

  config.vm.define :dk1 do |dk1|
    dk1.vm.hostname = "dk1"
    dk1.vm.network :private_network, ip: "192.168.51.6"
    dk1.vm.provision "shell" do |s|
      s.inline = $bootstrap_script
      s.privileged = false
    end
    dk1.vm.provider "virtualbox" do |vb|
      vb.name = "dk1-vm"
      vb.customize ["modifyvm", :id, "--memory", 1024]
      vb.customize ["modifyvm", :id, "--cpus", 1]
      #vb.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', 'docker.vdi']
    end
    dk1.vm.synced_folder "~/.squid/dk1", "/var/spool/squid", 
      owner: "root",
      group: "root",
      type: "virtualbox",
      :mount_options => ["dmode=777","fmode=666"]
    #dk1.vm.provision "ansible" do |a|
    #  a.playbook = "site.yml"
    #  a.inventory_path = "hosts"
    #end
  end

  # Mesos Box 1

  config.vm.define :node1 do |node1|
    node1.vm.hostname = "node1"
    node1.vm.network :private_network, :ip => "192.168.51.2"
    node1.vm.provision "shell" do |s|
      s.inline = $bootstrap_script
      s.privileged = false
    end
    #node1.vm.provision "ansible" do |a|
    #  a.playbook = "site.yml"
    #  a.inventory_path  = "hosts"
    #end
    node1.vm.provider "virtualbox" do |vb|
      vb.name = "node1-vm"
      vb.customize ["modifyvm", :id, "--memory", 2048]
      vb.customize ["modifyvm", :id, "--cpus", 2]
    end
  end

  # Mesos Box 2

  config.vm.define :node2 do |node2|
    node2.vm.hostname = "node2"
    node2.vm.network :private_network, :ip => "192.168.51.3"
    node2.vm.provision "shell" do |s|
      s.inline = $bootstrap_script
      s.privileged = false
    end
    #node2.vm.provision "ansible" do |a|
    #  a.playbook = "site.yml"
    #  a.inventory_path = "hosts"
    #end
    node2.vm.provider "virtualbox" do |vb|
      vb.name = "node2-vm"
      vb.customize ["modifyvm", :id, "--memory", 2048]
      vb.customize ["modifyvm", :id, "--cpus", 2]
    end
  end

  # Mesos Box 3

  config.vm.define :node3 do |node3|
    node3.vm.hostname = "node3"
    node3.vm.network :private_network, :ip => "192.168.51.4"
    node3.vm.provision "shell" do |s|
      s.inline = $bootstrap_script
      s.privileged = false
    end
    #node3.vm.provision "ansible" do |a|
    #  a.playbook = "site.yml"
    #  a.inventory_path = "hosts"
    #end
    node3.vm.provider "virtualbox" do |vb|
      vb.name = "node3-vm"
      vb.customize ["modifyvm", :id, "--memory", 2048]
      vb.customize ["modifyvm", :id, "--cpus", 2]
    end
  end

  # HAProxy Box

  config.vm.define :ha1 do |ha1|
    ha1.vm.hostname = "ha1"
    ha1.vm.network :private_network, ip: "192.168.51.5"
    ha1.vm.provision "shell" do |s|
      s.inline = $bootstrap_script
      s.privileged = false
    end
    #ha1.vm.provision "ansible" do |a|
    #  a.playbook = "site.yml"
    #  a.inventory_path = "hosts"
    #end
    ha1.vm.provider "virtualbox" do |vb|
      vb.name = "ha1-vm"
      vb.customize ["modifyvm", :id, "--memory", 2048]
      vb.customize ["modifyvm", :id, "--cpus", 2]
    end
  end

end
#end
