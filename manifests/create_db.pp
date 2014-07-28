#
#
#
#
#
#
class galaxy::create_db {
  $directory = hiera("galaxy::universe::app_directory")
  exec { 'common_startup.sh':
    path    => '/usr/bin:/usr/sbin:/bin:/sbin',
    cwd     => $directory,
    user    => 'galaxy',
    group   => 'galaxy',
    command => "$directory/scripts/copy_sample_files.sh",
    timeout => 500,
  } ->
  exec { 'fetch_eggs':
    path    => '/usr/bin:/usr/sbin:/bin:/sbin',
    cwd     => $directory,
    user    => 'galaxy',
    group   => 'galaxy',
    command => "python $directory/scripts/fetch_eggs.py",
    timeout => 500,
  } ->
  exec { 'create_db.sh':
    path    => '/usr/bin:/usr/sbin:/bin:/sbin',
    cwd     => $directory,
    user    => 'galaxy',
    group   => 'galaxy',
    command => "$directory/create_db.sh",
    timeout => 500,
  } ->
  class { "galaxy::first_run":
    directory => $directory
  }
}
