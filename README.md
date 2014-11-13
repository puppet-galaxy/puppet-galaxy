#Galaxy
####Table of Contents
1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Usage](#usage)
    * [Classes](#classes)
        * [Class: galaxy](#class-galaxy)
        * [Class: galaxy::dependencies](#class-galaxydependencies)
        * [Class: galaxy::params](#class-galaxyparams)
        * [Class: galaxy::common_startup](#class-galaxycommon_startup)
        * [Class: galaxy::create_db](#class-galaxycreate_db)
        * [Class: galaxy::manage_tools](#class-galaxymanage_tools)
        * [Class: galaxy::install](#class-galaxyinstall)
        * [Class: galaxy::job_conf](#class-galaxyjob_conf)
        * [Class: galaxy::service](#class-galaxyservice)
        * [Class: galaxy::toolshed_conf](#class-galaxytoolshed_conf)
        * [Class: galaxy::galaxy_ini](#class-galaxygalaxy_ini)
5. [Parameters](#parameters)
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

####Class: `galaxy::common_startup`
This class writes common_startup.sh from galaxy-central and execute it.
This convert .samples files in .ini files and fetch the eggs.

####Class: `galaxy::create_db`
This class executes create_db.sh to create a database and update it at the last version.

####Class: `galaxy::manage_tools`
This class executes  manage_tools.py wich updates the tools.

####Class: `galaxy::install`
This class download the remote repository from bickbuckets.org/galaxy/galaxy-dist with mercurial.

####Class: `galaxy::job_conf`
This class writes the job_conf.xml file with a template. Make sure the numbers of background workers (handlers) matches the numberwich is in galaxy_ini.pp

####Class: `galaxy::service`
This class configures galaxy service. Currently debain/redhat are the only two supported.

####Class: `galaxy::toolshed_conf`
This class writes Galaxy toolshed configuration. Specifies which toolsheds are available to use in the web interface.

####Class: `galaxy::galaxy_ini`

This class writes the galaxy.ini , the main configuration file of Galaxy.

##Parameters

See code interne documentation.
All the parameters can be set by Hiera, using automatic parameter lookup :
http://docs.puppetlabs.com/hiera/1/puppet.html#automatic-parameter-lookup

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
