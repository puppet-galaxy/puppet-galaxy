class galaxy::first_run {
  exec { 'galaxy-first_run' :
     path => '/usr/bin:/usr/sbin:/bin:/sbin',
     cwd  => '/home/galaxy/galaxy-dist',
     user => 'galaxy',
     command => '/home/galaxy/galaxy-dist/run.sh --daemon',
     creates => '/home/galaxy/galaxy-dist/universe_wsgi.ini',
     require => Class['galaxy::update'],
  }
}
