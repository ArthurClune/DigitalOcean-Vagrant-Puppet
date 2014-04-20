
# FQDN of host
host="my.host.name"

Vagrant.configure('2') do |config|

  config.vm.hostname = host
  config.ssh.username = "vagrant"

  config.vm.provider :digital_ocean do |provider, override|
    override.ssh.private_key_path = '~/.ssh/id_rsa'
    override.vm.box = 'digital_ocean'
    override.vm.box_url = "https://github.com/smdahlen/vagrant-digitalocean/raw/master/box/digital_ocean.box"

    # Edit the DigitalOcean config to taste
    provider.image = 'Ubuntu 14.04 x64'
    provider.region = 'Amsterdam 2'
    provider.client_id = 'your_client_id'
    provider.api_key = 'your_api_key'
    provider.setup = true
    # provider.size  = '1GB'
  end


  # This line MUST come before the puppet config
  config.vm.provision :shell, :path => "first_boot.sh", :args => host

  # now you can use the standard Vagrant/Puppet stuff
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.manifest_file  = "base.pp"
  end

end
