#
#
#
#
#
#
class galaxy::create_db {
  $directory = hiera("galaxy::universe::app_directory")
  class { "galaxy::first_run":
    directory => $directory
  }
  #exec { 'create_db.sh':
    #require =>  Class ['galaxy::common_startup'],
    #path    => '/usr/bin:/usr/sbin:/bin:/sbin',
    #cwd     => $directory,
    #user    => 'galaxy',
    #group   => 'galaxy',
    #command => "$directory/create_db.sh",
    #timeout => 500,
  #}
}
