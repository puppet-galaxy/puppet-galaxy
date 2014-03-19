class galaxy::service {

  file { '/etc/init.d/galaxy' :
    source   => 'puppet:///modules/galaxy/galaxy.debian-init',
    owner    => 'root',
    group    => 'root',
    mode     => '0755',
    require  => Class['galaxy::first_run'],
  }

  service { 'galaxy' :
    ensure     => 'running',
    enable     => true,
    require    => File['/etc/init.d/galaxy'],
  }
}
