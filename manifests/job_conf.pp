define galaxy::job_conf(
  directory = $galaxy::params::directory,
  number_of_background_workers = 4,

  # Runners
  enable_runner_local = true,
  enable_runner_pbs = false,
  enable_runner_drmaa = false,
  enable_runner_lwr = false,
  enable_runner_cli = false,
  enable_runner_condor = false,

  default_worker_threads = 4,

  default_destination = 'local',
  destinations = [
    { id => 'local', runner => 'local' }
  ]
){
  
  # Currently copy/pasted from universe.pp, need to refactor into settings once.
  $number_of_background_workers_array = range("0", -1+$number_of_background_workers)

  file { "$directory/job_conf.xml":
    content => template("galaxy/job_conf.xml.erb"),
  }
}
