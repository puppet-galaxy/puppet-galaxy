define galaxy::install(
  directory = $galaxy::params::directory
){
  vcsrepo { $directory:
    ensure => present,
    user => 'galaxy',
    provider => hg,
    source => 'https://bitbucket.org/galaxy/galaxy-dist/',
  } 
}
