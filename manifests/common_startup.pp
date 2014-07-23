#
#
#
#
#
class galaxy::common_startup{
  include galaxy::params
  $directory = $galaxy::params::app_directory
  file { "$directory/common_startup.sh":
    require => Class['galaxy::universe'],
    source  => '/etc/puppet/modules/galaxy/files/common_startup.sh',
    mode    => 'a=r+w+x',
    owner   => 'galaxy',
    group   => 'galaxy',
  }->
  exec { 'Common Startup':
    path    => '/usr/bin:/usr/sbin:/bin:/sbin',
    cwd     => $directory,
    command => 'sh common_startup.sh',
    user    => 'galaxy',
    require => File["$directory/common_startup.sh"],
  }
}
