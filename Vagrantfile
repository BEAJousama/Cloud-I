Vagrant.configure("2") do |config|
  config.vm.define "cloud" do |cloud|
    cloud.vm.box = "ubuntu/jammy64"
    cloud.vm.network "private_network", ip: "192.168.56.110"
    cloud.vm.hostname = "cloud"
    cloud.ssh.forward_agent = true
    cloud.ssh.port = 2222
    cloud.vm.synced_folder ".", "/CLOUD-1"
    cloud.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.cpus = 1
    end
    cloud.vm.provision "shell", inline: <<-SHELL
      sudo apt-get update
      sudo apt-get install -y python3-dnspython python3-pip python3-venv ansible sshpass
      # ssh-keyscan -H 192.168.56.110 >> ~/.ssh/known_hosts
      python3 -m venv myenv
      source myenv/bin/activate
      myenv/bin/pip install --upgrade dnspython ansible
    SHELL
  end
end