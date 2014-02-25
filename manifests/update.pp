class galaxy::update {
  exec { 'galaxy-update' :
    path    => '/bin:/usr/bin',
    cwd     => '/home/galaxy/galaxy-dist',
    command => 'hg update stable; touch update_done',
    creates => '/home/galaxy/galaxy-dist/update_done',
    require => Class['galaxy::install'],
  }
}

