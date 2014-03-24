class galaxy::dependencies(){

  package { 'mercurial' :
    ensure => installed,
  }

  package { 'python' :
    ensure => installed,
  }

  package { 'tar' :
    ensure => installed,
  }
 
  if 'Debian' == $osfamily {
    package { 'dpkg' :
      ensure => installed,
    }
  }

}
