define galaxy::service (
  $directory = $galaxy::params::directory,
){
  case $osfamily {
    Debian: { $source='galaxy/galaxy.debian-init.erb'}
    RedHat: { $source='galaxy/galaxy.fedora-init.erb'}
    default: {fail('no init script for this osfamily')}
  }
  file { "/etc/init.d/galaxy-$name":
    content  => template($source),
    owner    => 'root',
    group    => 'root',
    mode     => '0755',
#  } -> service { "galaxy-$name" :
 #   ensure     => 'running',
  #  enable     => true,
   # require    => File["/etc/init.d/galaxy-$name"],
  }
}
