Vagrantfile scaffold
====================

```
###
# Config
###

VAGRANTFILE_API_VERSION = '2'
DEBUG = false

DEFAULT_BOX_NAME = 'ubuntu-14.04-lnpm-141003'
DEFAULT_BOX_URL = 'file:///Users/Matt/www/vagrant/boxes/' + DEFAULT_BOX_NAME + '.box'
DEFAULT_MEMORY_MAX_MEGABYTES = 512
DEFAULT_CPU_MAX_PERCENT = 100
DEFAULT_PORTS = []
DEFAULT_SYNCED_FOLDERS = []
DEFAULT_PROVISION_PUPPET = false

nodes = [
    {
        :name => 'testbox',
        :ip => '192.168.0.100',
        :provision_puppet => true,
        :synced_folders => [
            {
                :local => '/Users/Matt/www/',
                :remote => '/www'
            }
        ]
    }
]

###
# Begin
###

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

    nodes.each do |node|

        config.vm.define node[:name] do |node_config|

            ###
            # Defaults
            ###

            # @TODO - Ruby probably has a better way of doing this

            box_name = node[:box_name] ? node[:box_name] : DEFAULT_BOX_NAME
            box_url = node[:box_url] ? node[:box_url] : DEFAULT_BOX_URL
            memory_max_megabytes = node[:memory_max_megabytes] ? node[:memory_max_megabytes] : DEFAULT_MEMORY_MAX_MEGABYTES
            cpu_max_percent = node[:cpu_max_percent] ? node[:cpu_max_percent] : DEFAULT_CPU_MAX_PERCENT
            ports = node[:ports] ? node[:ports] : DEFAULT_PORTS
            synced_folders = node[:synced_folders] ? node[:synced_folders] : DEFAULT_SYNCED_FOLDERS
            provision_puppet = node[:provision_puppet] ? node[:provision_puppet] : DEFAULT_PROVISION_PUPPET

            ###
            # Basic setup
            ###

            node_config.vm.box = box_name
            node_config.vm.box_url = box_url
            node_config.vm.hostname = node[:name]
            node_config.vm.network "private_network", ip: node[:ip]

            ###
            # Port forwarding
            ###

            ports.each do |port|
                node_config.vm.network(
                    "forwarded_port",
                    guest: port[:guest],
                    host: port[:host]
                )
            end

            ###
            # Synced folders
            ###

            synced_folders.each do |folder|
                node_config.vm.synced_folder(
                    folder[:local],
                    folder[:remote],
                    type: "nfs",
                    # Settings below prevents 'failed to set owner to "0" - operation not permitted'
                    # https://github.com/puphpet/puphpet/issues/206
                    :map_uid => 0,
                    :map_gid => 0
                )
            end

            ###
            # Virtualbox
            ###

            node_config.vm.provider "virtualbox" do |vb_config|

                if DEBUG
                    vb_config.gui = true
                end

                vb_config.customize [
                    'modifyvm', :id,
                    '--name', node[:name],
                    '--memory', memory_max_megabytes.to_s,
                    '--cpuexecutioncap', cpu_max_percent.to_s
                ]

            end

            ###
            # Puppet
            ###

            if provision_puppet

                node_config.vm.provision "puppet" do |puppet_config|

                    puppet_config.manifests_path = "puppet/manifests"
                    puppet_config.manifest_file = node[:name] + ".pp"
                    puppet_config.module_path = "puppet/modules"

                    if DEBUG
                        puppet_config.options = "--verbose --debug"
                    end

                end

            end

        end

    end

end
```