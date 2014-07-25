# == Class: galaxy::instance
#
# Class which represents a single instance of a galaxy server. This was done
# this way in the event that you have more than one galaxy server running on a
# single host (e.g., development and production)
#
# === Parameters
#
# [*galaxy_branch*]
#   Which branch of galaxy's development to pull from. Options are "stable" and
#   "deafult", where default is the primary branch for development work.
#
# [*directory*]
#   The main directory for galaxy instances that will be installed on this
#   server.
#
# [*custom_toolsheds*]
#   An array of hashes with keys "url" and "name" for each. These toolsheds
#   will then be available to the user when trying to install software inside
#   of galaxy
#
# === Examples
#
#  galaxy::instance { 'production':
#    custom_toolsheds => [
#      { name => "My Toolshed", url => "https://localhost/toolshed/" }
#    ],
#    galaxy_branch => 'stable',
#  }
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
define galaxy::instance (
  $directory = $galaxy::params::directory,
  $galaxy_branch = $galaxy::params::galaxy_branch,
  $custom_toolsheds = [],
  $id_secret,
) {

  galaxy::install{ "$name":
    directory => "$directory",
    galaxy_branch => $galaxy_branch,
  } -> galaxy::first_run{ "$name":
    directory => "$directory"
  } -> galaxy::service { "$name":
    directory => "$directory"
  }

  # TODO: refresh the service
  galaxy::toolshed_conf{ "$name":
    directory => "$directory",
    custom_toolsheds => $custom_toolsheds,
  }
  galaxy::job_conf { "$name":
    directory => "$directory",
  }

  galaxy::universe{ "$name":
    directory => "$directory",
    id_secret => $id_secret,
  }
}
