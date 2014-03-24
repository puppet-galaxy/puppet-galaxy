define galaxy::first_run(
  directory = $galaxy::params::directory
){
  exec { "galaxy-${name}-eggs-and-universeconf":
     path => '/usr/bin:/usr/sbin:/bin:/sbin',
     cwd  => $directory,
     user => 'galaxy',
     # Run the 'stop' command so the server runs the conf file generating stuff once
     command => "bash run.sh --stop-daemon",
     creates => "$directory/universe_wsgi.ini",
  }
}
