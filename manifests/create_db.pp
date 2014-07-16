#
#
#
#
#
#
class galaxy::create_db {
  $app_directory = $galaxy::params::app_directory
  exec { 'create_db.sh':
    require =>  Class ['galaxy::universe'],
    path    => '/usr/bin:/usr/sbin:/bin:/sbin',
    cwd     => $app_directory,
    user    => 'galaxy',
    command => 'sh create_db.sh',
    timeout => 500,
  }
}
