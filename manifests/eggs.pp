#
#
#
#
#
class galaxy::eggs{
  include galaxy::params
  $directory = $galaxy::params::app_directory
  file { "$directory/common_startup.sh":
    source  => 'galaxy/common_startup.sh',
    mode    => 'a=r+w+x',
  }->
  exec { 'Common Startup':
    path    => '/usr/bin:/usr/sbin:/bin:/sbin',
    cwd     => $directory,
    user    => 'galaxy',
    command => 'sh common_startup.sh',
  }    
}
