# == Class: galaxy::first_run
#
# On first run, galaxy grabs a large number of eggs and sets up configuration files from templates. We do that manually here
#
# === Examples
#
#  galaxy::first_run{'development': }
#
# === Authors
#
# M. Loaec  <mloaec@versailles.inra.fr>
# O. Inizan <oinizan@versailles.inra.fr>
# E. Rasche <rasche.eric@yandex.ru>
# S. Bridel <sbridel@versailles.inra.fr>
#
# === Copyright
#
# Copyright 2014, unless otherwise noted.
#
define galaxy::first_run(
  $directory = $galaxy::params::directory
){
  exec { "galaxy-${name}-eggs-and-universeconf":
    path => '/usr/bin:/usr/sbin:/bin:/sbin',
    cwd  => $directory,
    user => 'galaxy',
    command => "bash run.sh --daemon",
    timeout => 0, 
    creates => "$directory/universe_wsgi.ini",
  }->
  exec { 'finish first run':
    path => '/usr/bin:/usr/sbin:/bin:/sbin', 
    command => "sleep 30 |grep serving $directory/paster.log;",
    tries => 100,
    returns => 0,
    creates => "$directory/universe_wsgi.ini",
  }->
  exec { 'stop daemon':
    path => '/usr/bin:/usr/sbin:/bin:/sbin',
    cwd  => $directory,
    user => 'galaxy',
    command => "bash run.sh --stop-daemon",  
    creates => "$directory/universe_wsgi.ini",
  }
}
