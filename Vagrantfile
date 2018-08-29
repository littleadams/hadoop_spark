Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu16.04"
  config.vm.define :master do |master|
    master.vm.hostname = "master"
    master.vm.provider :virtualbox do |v|
      v.name = "master"
      v.memory = 2048
      v.cpus = 1
    end
    master.vm.network :private_network, ip: "10.211.55.100"
    master.vm.provision :shell, path: "bootstrap_master.sh"
  end


  (1..2).each do |i|
    config.vm.define "node#{i}" do |node|
      node.vm.hostname = "node#{i}"
      node.vm.provider :virtualbox do |v|
	    v.name = "node#{i}"
        v.memory = 1024
        v.cpus = 1
      end
      node.vm.network :private_network, ip: "10.211.55.10#{i}"
	  node.vm.provision :shell, path: "bootstrap_node.sh"
    end
  end
end


