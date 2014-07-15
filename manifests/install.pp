# == Class: galaxy::install
#
# Clones the remote repository
#
# === Parameters
#
# [*directory*]
#   The main directory for galaxy instances that will be installed on this
#   server.
#
# [*galaxy_branch*]
#   Which branch of galaxy's development to pull from. Options are "stable" and
#   "deafult", where default is the primary branch for development work.
#
# === Examples
#
#  galaxy::install{ 'development':
#    directory => '/home/galaxy/'
#  }
# # === Authors
#
# M. Loaec <mloaec@versailles.inra.fr>
# O. Inizan <oinizan@versailles.inra.fr>
# Eric Rasche <rasche.eric@yandex.ru>
#
# === Copyright
#
# Copyright 2014, unless otherwise noted.
#
class galaxy::install(
  $install_directory = "$galaxy::params::app_directory/",
  $galaxy_branch     = $galaxy::params::galaxy_branch,
){

  # There is a "bug" here in that every puppet run we'll get notifications of switching branches, even though we're not actually making changes. E.g.,
  #
  #Notice: /Stage[main]/Custom::Puppetlxc/Galaxy::Instance[test]/Galaxy::Install[test]/Vcsrepo[/home/galaxy/galaxy-dist/]/revision: revision changed '29ce93a13ac7' to 'default'
  #
  # I'm not sure what the best course of action here is. Let the module clutter our logs up or switch to running commands (test for branch/run with onlyif)
  vcsrepo { $install_directory:
    require  => Class ['galaxy'],
    ensure   => present,
    user     => 'galaxy',
    provider => hg,
    source   => 'https://bitbucket.org/galaxy/galaxy-dist/',
    revision => $galaxy_branch,
  }
}
