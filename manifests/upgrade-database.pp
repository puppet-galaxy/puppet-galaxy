# == Class galaxy::upgrade-database
# This class execute manage.db update.
#
# === Authors
# S. Bridel <sebastien.bridel@versailles.inra.fr>
#
# === Copyright
#
# Copyright 2014, unless otherwise noted.
class galaxy::upgrade-database() { 
  $directory = $galaxy::params::directory
  exec { "galaxy-${name}-eggs-and-universeconf":
    path    => '/usr/bin:/usr/sbin:/bin:/sbin',
    cwd     => $directory,
    user    => 'galaxy',
    command => "sh manage_db.sh upgrade",
    returns => 1,
  }
}
