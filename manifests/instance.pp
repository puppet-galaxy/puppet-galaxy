define galaxy::instance (
  $create_user = $galaxy::params::create_user,
  $directory = $galaxy::params::directory,
  $galaxy_branch = $galaxy::params::galaxy_branch,
  $custom_toolsheds = [],
) {

  galaxy::install{ "$name":
    directory => "$directory"
  } -> galaxy::first_run{ "$name":
    directory => "$directory"
  #} -> galaxy::service { "$name": 
  #  directory => "$directory"
  }
  
  galaxy::toolshed_conf{ "$name":
    directory => "$directory",
    custom_toolsheds => $custom_toolsheds,
  } 
}
