# == Class: galaxy::job_conf
#
# Configures the job_conf.xml file. Should ensure that the number of background
# workers here matches what is specified for galaxy::universe
#
# === Parameters
#
# [*directory*]
#   The main directory for galaxy instances that will be installed on this
#   server.
#
# [*number_of_background_workers*]
#   Same number of background workers that were specified in the
#   galaxy::universe call
#
# [*enable_runner_local*]
#   Local job runner, no further config options
#
# [*enable_runner_pbs*]
#   Enables PBS runner. If config options are missing, please let us know
#
# [*enable_runner_drmaa*]
#   Enables DRMAA runner. If config options are missing, please let us know
#
# [*enable_runner_lwr*]
#   Enables LWR runner. Please see docs at https://lwr.readthedocs.org/ for
#   more info. If config options are missing, please let us know
#
# [*enable_runner_cli*]
#   Enables CLI runner. If config options are missing, please let us know
#
# [*enable_runner_condor*]
#   Enables HTCondor job runner. No further config options available.
#
# [*default_worker_threads*]
#   Default number of worker threads for each job runner
#
# [*default_destination*]
#   Default job runner to send jobs to
#
# [*destinations*]
#   Array of hashes for destinations, with keys "id" and "runner" for each.
#   TODO: This could probably be automatically generated from wich runners
#   you've enabled and will be fixed in the future
#
# === Examples
#
#  galaxy::job_conf { "development":
#    directory => "/home/galaxy/galaxy-dist/",
#    enable_runner_local => false,
#    enable_runner_condor => true,
#    default_destination => 'condor'
#    destinations => [
#      { id => 'condor', runner => 'condor' }
#    ]
#  }
#
# === Authors
#
# Eric Rasche <rasche.eric@yandex.ru>
#
# === Copyright
#
# Copyright 2014, unless otherwise noted.
#
class galaxy::job_conf(
  $app_directory                = galaxy::universe::app_directory,
  $number_of_background_workers = 2,
  # Runners
  $enable_runner_local    = true,
  $enable_runner_pbs      = true,
  $enable_runner_drmaa    = true,
  $enable_runner_lwr      = true,
  $enable_runner_cli      = true,
  $enable_runner_condor   = true,
  $default_worker_threads = 2,
  $default_destination    = local,
  $destinations = [
    { id => 'local', runner => 'local' }
  ]
){

  # Currently copy/pasted from universe.pp, need to refactor into settings once.
  $number_of_background_workers_array = range("0", -1+$number_of_background_workers)
  file { "$app_directory/job_conf.xml":
    require => Class['galaxy::toolshed_conf'],
    content => template("galaxy/job_conf.xml.erb"),
    owner   => 'galaxy',
    group   => 'galaxy',
  }
}
