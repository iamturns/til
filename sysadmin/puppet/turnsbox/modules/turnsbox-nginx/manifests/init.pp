class turnsbox-nginx {

    file { '/etc/nginx/sites-available/www.conf':
        source => "puppet:///modules/turnsbox-nginx/www.conf",
    }

    file { '/etc/nginx/sites-enabled/www.conf':
        ensure => 'link',
        target => '/etc/nginx/sites-available/www.conf',
    }

}
