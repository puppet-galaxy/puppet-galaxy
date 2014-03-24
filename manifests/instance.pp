define galaxy::instance (
  $create_user = $galaxy::params::create_user,
  $directory = $galaxy::params::directory,
  $galaxy_branch = $galaxy::params::galaxy_branch,
) {

  galaxy::install{ "$name":
    directory => "$directory"
  } -> galaxy::first_run{ "$name":
    directory => "$directory"
  } -> galaxy::service { "$name": 
    directory => "$directory"
  }
}
