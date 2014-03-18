class galaxy::debian-init {
  exec { 'modify-init' :
    path    => '/bin:/usr/bin',
    cwd     => '/home/galaxy/galaxy-dist/contrib',
    user    => 'galaxy',
    command => 'sed s/galaxy_dist/galaxy-dist/ galaxy.debian-init > galaxy.debian-init-modified;cp galaxy.debian-init-modified galaxy.debian-init', 
    creates => '/home/galaxy/galaxy-dist/contrib/galaxy.debian-init-modified',
    require => Class['galaxy::first_run'],
  }

}
