# -*- mode: ruby -*-
# vi: set ft=ruby :

$prereqs = <<PREREQS
wget https://www.getchef.com/chef/install.sh
sh install.sh -v 0.6.2-1 -P chefdk
# could maybe be done as 'bash <(curl https://www.getchef.com/chef/install.sh) -v 0.6.2-1 -P chefdk'

apt-get install -y -q git

hash -r

git clone https://github.com/cubranic/islandora_chef -b trusty64
cd islandora_chef

berks vendor vendor

cat <<'EOF' > solo.rb
root = File.absolute_path(File.dirname(__FILE__))
file_cache_path root + '/cache'
cookbook_path root + '/vendor'
EOF

cat <<EOF > solo.json
{
    "tomcat" : {
        "base_version": "7",
        "java_options": "-Xms2056M -Xmx2056M -Djava.awt.headless=true -XX:MaxPermSize=256m"
    },
    "run_list": [
        "recipe[ubuntu-baseline]",
        "recipe[islandora]"
    ]
}
EOF

chef-solo -c solo.rb -j solo.json
PREREQS

Vagrant.configure("2") do |config|
  if Vagrant.has_plugin?("landrush")
    config.landrush.enabled = true
    config.vm.hostname = "islandora-berkshelf.vagrant.dev"
  else
    config.vm.hostname = "islandora-berkshelf"

    # Forward port mappings
    config.vm.network :forwarded_port, guest: 8080, host: 8080    # Tomcat
    config.vm.network :forwarded_port, guest: 3306, host: 3306    # MySQL
    config.vm.network :forwarded_port, guest: 5432, host: 5432    # PostgreSQL
    config.vm.network :forwarded_port, guest: 80,   host: 8181    # Apache
  end

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "ubuntu/trusty64"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
#  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box"

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", '3000']
  end

  ## Install required packages and run chef directly
  config.vm.provision "shell", inline: $prereqs
end
