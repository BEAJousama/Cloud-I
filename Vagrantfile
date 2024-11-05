Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "private_network", ip: "192.168.56.110"
  config.vm.hostname = "cloud"
  config.ssh.forward_agent = true
  config.ssh.port = 2222
  config.vm.synced_folder ".", "/CLOUD-1"
    config.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.cpus = 1
 end
  config.vm.provision :shell, path: "script.sh", privileged: false
end  