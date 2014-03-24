# == Class: galaxy
#
# Full description of class galaxy here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  include 'galaxy'
#  galaxy::instance { 'Development':
#    directory => '/home/galaxy/galaxy-test'
#  }
#
# === Authors
#
# Author Name <mloaec@versailles.inra.fr>
# Author Name <oinizan@versailles.inra.fr>
# Eric Rasche <rasche.eric@yandex.ru>
#
# === Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#
class galaxy ( 
	$galaxy_branch = $galaxy::params::galaxy_branch,
	$create_user   = $galaxy::params::create_user,
	$directory     = $galaxy::params::directory,
) inherits galaxy::params {
  class { 'galaxy::dependencies': }
  if($create_user){
    user { 'galaxy':
      ensure     => present,
      home       => $directory,
      managehome => true,
    }
  }
}
