# == Class: galaxy::params
#
# Default parameters for the galaxy puppet package to use
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
class galaxy::params {
  $galaxy_branch = 'release_2014.06.02'
  $galaxy_repository = 'https://bitbucket.org/galaxy/galaxy-dist/'
  $create_user   = true
  $app_directory = '/home/galaxy/galaxy-dist'
  $home_direcory = '/home/galaxy'
  $create_user = true
  $directory = '/home/galaxy/galaxy-dist/'
}
