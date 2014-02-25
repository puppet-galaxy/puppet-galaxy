class galaxy::install {
  exec { 'galaxy-install' :
    path    => '/bin:/usr/bin',
    cwd     => '/home/galaxy',
    user    => 'galaxy',
    command => 'hg clone https://bitbucket.org/galaxy/galaxy-dist/',
    creates => '/home/galaxy/galaxy-dist',
    require => Class['galaxy::dependencies'],
  }
}


