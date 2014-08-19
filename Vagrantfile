# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "BuildrootVM"

  config.vagrant.host = :detect

  config.vm.box_url = "https://github.com/castone18/BuildrootVM/BuildrootVM.box"
  config.vm.boot_timeout = 75
  config.vm.graceful_halt_timeout = 35
  config.vm.guest = :linux

  config.vm.synced_folder ".", "/vagrant"

  config.vm.provider :virtualbox do |vb|
     #vb.gui = true
     #vb.customize ["modifyvm", :id, "--memory", "512"]
     vb.memory = 512
     vb.cpus = 1
  end

  #config.vm.provision "shell", path: "https://github.com/castone18/BuildrootVM/provisioner.sh"
  #config.vm.provision "shell", path: "provisioner.sh"

  config.ssh.default.username = "tc"
  config.ssh.shell = "/bin/bash"
  config.ssh.guest_port = 22
  config.ssh.forward_agent = true
  config.ssh.forward_x11 = false
  config.ssh.keep_alive = true
end
