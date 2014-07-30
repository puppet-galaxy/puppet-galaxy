#Galaxy
####Table of Contents
1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Usage](#usage)
    * [Classes](#classes)
        * [Class: galaxy](#class-galaxy)
        * [Class: galaxy::dependencies](#class-galaxydependencies)
        * [Class: galaxy::params](#class-galaxyparams)
    * [Defined Types](#defined-types)
        * [Type: galaxy::first_run](#type-galaxyfirst_run)
        * [Type: galaxy::install](#type-galaxyinstall)
        * [Type: galaxy::job_conf](#type-galaxyjob_conf)
        * [Type: galaxy::service](#type-galaxyservice)
        * [Type: galaxy::toolshed_conf](#type-galaxytoolshed_conf)
        * [Type: galaxy::universe](#type-galaxyuniverse)
5. [Parameters](#parameters)
    * [Defaults paramaters: galaxy::params](#defaults-parameters)
       * [$galaxy_branch](#galaxy-branch)
       * [$createuser](#create-user)
       * [$directory](#directory)
    * [Galaxy Universe configuration file](#galaxy-universe)
    * [Galaxy Toolshed configuration file](#galaxy-toolshed)
    * [Galaxy Job configuration file](#galaxy-job)
6. [Github Project](#github-project)
7. [Contact](#contact)
8. [Galaxy Project](#galaxy-project)

##Overview
The Galaxy module allows you to download and make up a new instance of galaxy.

##Module Description
This is the Galaxy module. Galaxy is an open, web-based platform for accessible, reproducible, and transparent computational biomedical research.
This module contains the base blocks for Galaxy server configuration management. 
These base blocks are agregated in profiles and roles.
See urgi/galaxy-roles-profiles for Galaxy roles and profiles.

##Usage
###Classes
####Class: `galaxy::dependencies`
This class installs all the packages required to build one new Galaxy's instances: Mercurial , Python and Tar ( and Dpkg for Debian OS)

####Class: `galaxy::params`
This class sets the default parameters for the galaxy puppet module ( create user, directory and galaxy branch)

###Defined Types
####Type: `galaxy::first_run`
This type manages the first run of Galaxy. It means that Galaxy is started by run.sh --daemon and stopped by run.sh --stop-daemon once 

it has serving one time.

####Type: `galaxy::install`
This type download the remote repository from bickbuckets.org/galaxy/galaxy-dist with mercurial.

####Type: `galaxy::instance`
This type which represents a single instance of a galaxy server. This was done

this way in the event that you have more than one galaxy server running on a

single host (e.g., development and production)

####Type: `galaxy::job_conf`
This type writes the job_conf.xml file with a template. Make sure the numbers of background workers (handlers) matches the numberwich is in universe.pp

####Type: `galaxy::service`
This type configures galaxy service. Currently debain/redhat are the only two supported.

####Type: `galaxy::toolshed_conf`
This type writes Galaxy toolshed configuration. Specifies which toolsheds are available to use in the web interface.

####Type: `galaxy::universe`

This type writes the universe_wsgi.ini , the main configuration file of Galaxy.

##Parameters

##Github projects

Projects for base blocks and roles+profiles are hosted on github:


https://github.com/puppet-galaxy/puppet-galaxy


https://github.com/puppet-galaxy/galaxy-roles-profiles


##Contact

Mikael Loaec   mloaec@versailles.inra.fr


Olivier Inizan oinizan@versailles.inra.fr


Eric Rasche    rasche.eric@yandex.ru

##Galaxy Project 
http://galaxyproject.org
