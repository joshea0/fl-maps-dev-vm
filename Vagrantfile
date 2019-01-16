require 'yaml'
ANSIBLE_INVENTORY_DIR = 'ansible/inventories'

Vagrant.require_version ">= 1.5"

Vagrant.configure("2") do |config|

    _conf = YAML.load(
        File.open(
            File.join(File.dirname(__FILE__), 'ansible/vars/all.yml'),
            File::RDONLY
        ).read
    )

    box = _conf["vagrant_local"]["vm"]["box"]
    hostname = _conf["vagrant_local"]["vm"]["hostname"]
    ip = _conf["vagrant_local"]["vm"]["ip"]
    memory = _conf["vagrant_local"]["vm"]["memory"]
    puts "Vagrant VM using IP: #{ip} and hostname #{hostname}"

    config.vm.define hostname do |primary|
        primary.vm.provider :virtualbox do |v|
            v.name = hostname
            v.customize [
                "modifyvm", :id,
                "--name", hostname,
                "--memory", memory,
                "--natdnshostresolver1", "on",
                "--cpus", 1,
            ]
        end
        primary.vm.network :private_network, ip: ip
        primary.ssh.forward_agent = true
        primary.vm.box = box
    end

    config.vm.provision "vai" do |ansible|
      ansible.inventory_dir = ANSIBLE_INVENTORY_DIR
      ansible.groups = {
        "local" => [hostname]
      }
    end

    config.vm.provision :shell, run: "always", :path => "mongodb-mount-fix.sh"
end
