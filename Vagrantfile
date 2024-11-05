Vagrant.configure("2") do |config|
  config.vm.define "cloud" do |cloud|
    cloud.vm.box = "ubuntu/trusty64"
    cloud.vm.network "private_network", ip: "192.168.56.110"
    cloud.vm.hostname = "cloud"
    cloud.ssh.forward_agent = true
    cloud.ssh.port = 2222
    cloud.vm.synced_folder ".", "/CLOUD-1"
    cloud.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.cpus = 1
    end
    server.vm.provision "shell", inline: <<-SHELL
      sudo apt-get update
      sudo apt-get install ssh ansible sshpass
    SHELL
  end
end  