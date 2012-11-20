Vagrant::Config.run do |config|
  cookbook_location = 'remote';
  
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "precise64"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  # Boot with a GUI so you can see the screen. (Default is headless)
  # config.vm.boot_mode = :gui

  # Assign this VM to a host-only network IP, allowing you to access it
  # via the IP. Host-only networks can talk to the host machine as well as
  # any other machines on the same network, but cannot be accessed (through this
  # network interface) by any external networks.
  # config.vm.network :hostonly, "192.168.33.10"

  # Assign this VM to a bridged network, allowing you to connect directly to a
  # network using the host's network device. This makes the VM appear as another
  # physical device on your network.
  config.vm.network :bridged

  # Forward a port from the guest to the host, which allows for outside
  # computers to access the VM, whereas host only networking does not.
  config.vm.forward_port 80, 8080
  config.vm.forward_port 6379, 6379

  # Share an additional folder to the guest VM. The first argument is
  # an identifier, the second is the path on the guest to mount the
  # folder, and the third is the path on the host to the actual folder.
  # config.vm.share_folder "v-data", "/vagrant_data", "../data"

  # Enable provisioning with chef solo, specifying a cookbooks path, roles
  # path, and data_bags path (all relative to this Vagrantfile), and adding 
  # some recipes and/or roles.
  #
  config.vm.provision :chef_solo do |chef|
  
    case cookbook_location
    when 'local'
      chef.cookbooks_path = 'cookbooks'
    when 'remote'
      chef.recipe_url = 'https://github.com/seagoj/cookbook/archive/master.tar.gz'
    end
    
    chef.json = {
        :nginx => {
            :install_method => 'package',
            :default_site_enabled => true,
            :default_site_template => "php-site.erb"
        },
        :mysql => {
            :server_root_password => "1qaz2wsx3edc",
            :server_debian_password => "1qaz2wsx3edc",
            :server_repl_password => "1qaz2wsx3edc"
        }
     }
    
    chef.add_recipe("apt")
    # chef.add_recipe("ohai")
    chef.add_recipe("php5-fpm")
    chef.add_recipe("nginx")
    chef.add_recipe("mysql")
    chef.add_recipe("mysql::server")
    chef.add_recipe("redis::php")
  end
end
