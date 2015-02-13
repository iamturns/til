###
# General setup
###

group { 'puppet': ensure => 'present' }

Exec { path => [ '/bin/', '/sbin/', '/usr/bin/', '/usr/sbin/' ] }

stage { 'pre': before => Stage['main'] }
stage { 'post': require => Stage['main'] }

# Avoids puppet warning
# file { '/etc/puppet/hiera.yaml': ensure => 'present' }

###
# Begin
###

class { 'turnsbox-nginx': }

class { 'turnsbox-refresh':
    stage => 'post'
}
