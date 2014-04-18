DigitalOcean Puppet/Vagrant
===========================

Sample skeleton for using puppet + vagrant with Digital Ocean. It's basically standard
except that the Digitial Ocean Droplets do not include puppet, so we have to install
that before Vagrant tries to run it.

You'll need the Digital Ocean vagrant plugin

```
vagrant plugin install vagrant-digitalocean
```

Then edit the Vagrantfile. At a minimum you need to set your hostname and API key details.
You may also want to change the region and VM size. Then

```
vagrant up --provider=digital_ocean
````

As an exmaple, the puppet manifest copies two files into the home directory of the
vagrant user and also sets that user's shell to be zsh
