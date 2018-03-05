# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  #config.vm.box = "centos/7"
   #config.vm.network "forwarded_port", guest: 8080, host: 8080, host_ip: "127.0.0.1"
   #config.vm.network "forwarded_port", guest: 8301, host: 8301, host_ip: "127.0.0.1"
   config.vm.define :jenkins do |jenkins|
    config.vm.provision "shell" do |s|
      s.path = "provision-jenkins.sh"
    end
    jenkins.vm.box = "centos/7"
    jenkins.vm.hostname = "jenkins"
    jenkins.vm.network "forwarded_port", guest: 8080, host: 8080, host_ip: "127.0.0.1"
    jenkins.vm.network "private_network", ip: "10.1.2.10"
    #jenkins.vm.network "private_network", type: "dhcp"
  end
  config.vm.define :consul do |consul|
    config.vm.provision "shell" do |s|
      s.path = "provision-consul.sh"
    end
    consul.vm.box = "centos/7"
    consul.vm.hostname = "consul-server"
    consul.vm.network "forwarded_port", guest: 8500, host: 8500, host_ip: "127.0.0.1"
    consul.vm.network "forwarded_port", guest: 8300, host: 8300, host_ip: "127.0.0.1"
    consul.vm.network "forwarded_port", guest: 3000, host: 3000, host_ip: "127.0.0.1"
    consul.vm.network "private_network", ip: "10.1.2.11"
  end
  config.vm.define :prometheus do |prometheus|
    prometheus.vm.box = "centos/7"
    prometheus.vm.hostname = "prometheus"
    prometheus.vm.network "forwarded_port", guest: 9090, host: 9090, host_ip: "127.0.0.1"
    prometheus.vm.network "forwarded_port", guest: 3001, host: 3001, host_ip: "127.0.0.1"
    prometheus.vm.network "private_network", ip: "10.1.2.12"
  end
  config.vm.define :consul2 do |consul2|
    config.vm.provision "shell" do |s|
      s.path = "provision-consul.sh"
    end
    consul2.vm.box = "centos/7"
    consul2.vm.hostname = "consul-server2"
    consul2.vm.network "private_network", ip: "10.1.2.13"
  end
 config.vm.define :lb do |lb|
    config.vm.provision "shell" do |s|
      s.path = "provision-lb.sh"
    end
    lb.vm.box = "centos/7"
    lb.vm.hostname = "lb"
    lb.vm.network "private_network", ip: "10.1.2.14"
  end

end

