# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.hostname = "islandora-berkshelf"

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = 'ubuntu/precise64' # https://atlas.hashicorp.com/ubuntu/boxes/precise64

  # Forward port mappings
  config.vm.network :forwarded_port, guest: 8080, host: 8080    # Tomcat
  config.vm.network :forwarded_port, guest: 3306, host: 3306    # MySQL
  config.vm.network :forwarded_port, guest: 5432, host: 5432    # PostgreSQL
  config.vm.network :forwarded_port, guest: 80,   host: 8181    # Apache

  config.vm.provider "virtualbox" do |vb|
    vb.name = 'islandora'
    vb.customize ["modifyvm", :id, "--memory", '4096']
  end

  # Enabling the Berkshelf plugin
  config.berkshelf.enabled = true

  # Install a specific version of Chef on the node
  config.omnibus.chef_version = '11.12.0'

  config.vm.provision :chef_solo do |chef|
    # Log the heck out of everything
    chef.log_level = :debug
    chef.formatter = :doc

    chef.json = {
      # For installing a particular Islandora release
#      "islandora" => { "version" => "7.x-1.4"},

      # Defaults for Tomcat JVM memory use etc.
      # Needed to workaround http://stackoverflow.com/questions/19502173/
      "tomcat" => {
        "base_version" => '7',
        "java_options" => "-Xms2056M -Xmx2056M -Djava.awt.headless=true -XX:MaxPermSize=256m"
      }
    }

    chef.add_recipe 'ubuntu-baseline'
    chef.add_recipe 'islandora'
  end
end
