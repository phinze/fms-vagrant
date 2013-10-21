# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

def vmware?
  !!(defined? Hashicorp)
end

def box_url
  if vmware?
    'http://files.vagrantup.com/precise64_vmware.box'
  else
    'http://files.vagrantup.com/precise64.box'
  end
end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box     = 'precise64'
  config.vm.box_url = box_url

  config.vm.network :private_network, ip: "10.30.1.33"
  config.vm.hostname = 'fms.vagrant.dev'

  config.landrush.enable

  puppet_options = [].tap do |options|
    options << %w[--verbose --debug] if ENV['PUPPET_VERBOSE']
  end

  config.vm.provision :puppet, options: puppet_options do |puppet|
    puppet.manifests_path = 'manifests'
    puppet.module_path = 'modules'
    puppet.manifest_file = 'site.pp'
    puppet.facter = {
    'fms_serial' => ENV['FMS_SERIAL']
    }

  end
end