# == Class: galaxy::service
#
# Configures galaxy service. Currently debain/redhat are the only two supported.
#
# === Examples
#
#  galaxy::service { 'production': }
#  # This will create /etc/init.d/galaxy-production which you can then use via
#  # the system interface to control service state
#
# === Authors
#
# M. Loaec <mloaec@versailles.inra.fr>
# O. Inizan <oinizan@versailles.inra.fr>
# Eric Rasche <rasche.eric@yandex.ru>
#
# === Copyright
#
# Copyright 2014, unless otherwise noted.
#
define galaxy::service (){
  case $osfamily {
    Debian: { $source='galaxy/galaxy.debian-init.erb'}
    RedHat: { $source='galaxy/galaxy.fedora-init.erb'}
    default: {fail('no init script for this osfamily')}
  }
  file { "/etc/init.d/galaxy-$name":
    content  => template($source),
    owner    => 'root',
    group    => 'root',
    mode     => '0755',
  }-> 
  service { "galaxy-$name" :
    ensure     => 'running',
    enable     => true,
    require    => File["/etc/init.d/galaxy-$name"],
  }
}
