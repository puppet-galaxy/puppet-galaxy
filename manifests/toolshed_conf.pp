# == Class: galaxy::toolshed_conf
#
# Galaxy toolshed configuration. Specifies which toolsheds are available to use
# in the web interface.
#
# === Parameters
#
# [*directory*]
#   The main directory for galaxy instances that will be installed on this
#   server.
#
# === Examples
#
#  galaxy::toolshed_conf { "production":
#    custom_toolsheds => [
#      { name => 'Private Toolshed', url => 'https://localhost/toolshed/' }
#    ]
#  }
#
# === Authors
#
# Eric Rasche <rasche.eric@yandex.ru>
#
# === Copyright
#
# Copyright 2014, unless otherwise noted.
#
class galaxy::toolshed_conf (
  $app_directory = $galaxy::params::app_directory,
  $default_toolsheds = [
    { name => 'Galaxy main tool shed', url => 'http://toolshed.g2.bx.psu.edu/' },
    { name => 'Galaxy test tool shed', url => 'http://testtoolshed.g2.bx.psu.edu/' }
  ],
  $custom_toolsheds = [],
){
  file { "$app_directory/tool_sheds_conf.xml":
    require => Class['galaxy::universe'],
    content => template("galaxy/tool_sheds_conf.xml.erb"),
    owner   => 'galaxy',
    group   => 'galaxy',
  }

}
