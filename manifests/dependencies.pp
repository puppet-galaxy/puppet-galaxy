class galaxy::dependencies {

  user { 'galaxy':
    ensure     => present,
    home       => '/home/galaxy',
    managehome => true,
  }

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
