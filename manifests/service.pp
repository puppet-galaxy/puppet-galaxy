class galaxy::service {
  case $osfamily {
    Debian: { $source='puppet:///modules/galaxy/galaxy.debian-init'}
    RedHat: { $source='puppet:///modules/galaxy/galaxy.fedora-init'}
    default: {fail('no init script for this osfamily')}
  }
  file { '/etc/init.d/galaxy' :
    source   => $source,
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
