BuildrootVM
===========

A tinycore Linux based virtual machine for embedded Linux development using buildroot on Windows/Linux hosts.

##Usage
BuildrootVM depends on castone18/vagrant-tinycore on github, which provides the base box that BuildrootVM is built upon. Thus, clone
castone18/vagrant-tinycore and add the tinycore box to your vagrant boxes. After that, you can edit the Vagrantfile. For instance, you may want to
change the number of cpus. Then it is just a matter of doing a 'vagrant up'. On Linux you will need 'vagrant up --provider libvirt'.
