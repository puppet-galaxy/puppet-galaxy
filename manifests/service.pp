# == Class: galaxy::service
#
# Configures galaxy service. Currently debian/redhat are the only two supported.
#
# === Examples
#
#  galaxy::service { 'production': }
#  # This will create /etc/init.d/galaxy-production which you can then use via
#  # the system interface to control service state
#
# === Authors
#
# M. Loaec <mloaec@versailles.inra.fr>
# O. Inizan <oinizan@versailles.inra.fr>
# Eric Rasche <rasche.eric@yandex.ru>
#
# === Copyright
#
# Copyright 2014, unless otherwise noted.
#
define galaxy::service (
  $directory = $galaxy::params::directory,
  $wk_config = $galaxy::universe::wk_config,
){

  include supervisord
  supervisord::program { "galaxy_uwsgi":
    command     => "/usr/bin/uwsgi --plugin python --ini-paste $directory/universe_wsgi.ini",
    directory => "/home/galaxy/galaxy/",
    umask => "022",
    autostart => true,
    autorestart => "true",
    startsecs => 10,
    user => galaxy,
    numprocs => 1,
    environment => {
      "PYTHONPATH"   => "$directory/eggs/PasteDeploy-1.5.0-py2.7.egg",
    }
  }
  supervisord::program { "handler":
    command     => "python ./scripts/paster.py serve universe_wsgi.ini --server-name=handler%(process_num)s --pid-file=$directory/handler%(process_num)s.pid --log-file=$directory/handler%(process_num)s.log",
    directory => $direcotry,
    process_name => "handler%(process_num)s",
    numprocs => 4,
    umask => "022",
    autostart => true,
    autorestart => "true",
    startsecs => 15,
    user => galaxy,
    environment => {
      "PYTHON_EGG_CACHE"   => "/home/galaxy/.python-eggs"
    }
  }
  supervisord::group { "galaxy":
    programs  => ["handler"],
  }
}
