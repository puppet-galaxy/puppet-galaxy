#
#
#
#
#
class galaxy::manage_tools {
  $directory = $galaxy::params::app_directory
  exec { 'Manage Tools Upgrade':
  path    =>'/usr/bin:/usr/sbin:/bin:/sbin',
  cwd     => $directory,
  command => "python $directory/scripts/manage_tools.py upgrade",
  user    => 'galaxy',
  group   => 'galaxy',
  require  => Class['galaxy::create_db'],
  }
}
