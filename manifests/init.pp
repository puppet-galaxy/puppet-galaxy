# == Class: galaxy
#
# Main Galaxy class, required to set up dependencies. Will not create an instance on its own
#
# === Parameters
#
# [*galaxy_branch*]
#   Which branch of galaxy's development to pull from. Options are "stable" and
#   "deafult", where default is the primary branch for development work. 
#
# [*create_user*]
#   Should puppet automatically create a user for galaxy? If this option is
#   specified a user will be created using *directory* as their home directory.
#
# [*directory*]
#   The main directory for galaxy instances that will be installed on this
#   server.
#
#
# === Examples
#
#  class { 'galaxy':
#    create_user => true,
#    directory => /home/galaxy/,
#  }
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
class galaxy (
  $galaxy_branch = hiera("galaxy::universe::galaxy_branch", "stable"),
  $create_user   = hiera("galaxy::universe::create_user", true),
  $directory     = hiera("galaxy::universe::app_directory"),
) {
  include galaxy::dependencies
  if($create_user){
    user { 'galaxy':
      ensure     => present,
      home       => $home_directory,
      managehome => true,
    }
  }
}
