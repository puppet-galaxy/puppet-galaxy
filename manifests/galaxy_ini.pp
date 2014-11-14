# == Class: galaxy::galaxy_ini #
# galaxy.ini configuration
#
# === Parameters
#
# [*directory*]
#   The main directory for galaxy instances that will be installed on this
#   server.
#
# [*number_of_background_workers*]
#   Number of background workers to start. These workers will serve handling
#   jobs. Should be same number as specified for the job_conf
#
# [*handler_starting_port_number*]
#   First port number to use for web/job handlers. Ports will be used
#   sequentially from here; first set of ports is for job workers, second set
#   for web workers.
#
# [*handler_host_to_listen_on*]
#   Which host to listen on for job handlers
#
# [*handler_threadpool_workers*]
#   Number of threads in the handler threadpool (per worker)
#
# [*number_of_web_workers*]
#   Number of web workers to start, to service web requests
#
# [*webworker_host_to_listen_on*]
#   Which host to listen on for web workers
#
# [*webworker_threadpool_workers*]
#   Number of threads in the web handler threadpool (per worker)
#
# [*use_prefix*]
#   Set to true if you plan to run galaxy under a prefix like "/galaxy". This
#   option is commonly used if you're hosting multiple services on a single
#   host and are accessing them through urls like http://fqdn/service/
#
# [*proxy_prefix*]
#   String to use as the prefix.
#
# [*Filters*]
#   Filters are used to restrict access to tools based on user/group. See
#   https://wiki.galaxyproject.org/Admin/Config/Access%20Control for more
#   information
#
# [*tmp_file_dir*]
#   Directory for temporary files
#
# [*file_path*]
#   directory for user data
#
# [*tool_dependency_dir*]
#   directory for tool dependencies (e.g., blast executable for blast tools)
#
# [*tool_config_files*]
#   Locatoin of files used to configure the tool menu
#
# [*job_config_file*]
#   Filename for job_conf.xml
#
# [*webserver*]
#   Name of webserver. Choices are essentially 'apache' and 'nginx'. Other choices may cause issues
#
# [*xsendfile*]
#   Apache can handle file downloads (Galaxy-to-user) via mod_xsendfile. Set
#   this to True to inform Galaxy that mod_xsendfile is enabled upstream.
#
# [*x_accel_redirect*]
#   The same download handling can be done by nginx using X-Accel-Redirect.
#   This should be set to the path defined in the nginx config as an internal
#   redirect with access to Galaxy's data files
#
# [*x_archive_files*]
#   nginx can make use of mod_zip to create zip files containing multiple
#   library files. If using X-Accel-Redirect, this can be the same value as
#   that option.
#
# [*nginx_upload_store*]
#   (Currently not enabled!) nginx can also handle file uploads
#   (user-to-Galaxy) via nginx_upload_module. Configuration for this is
#   complex and explained in detail in the documentation linked above. The
#   upload store is a temporary directory in which files uploaded by the upload
#   module will be placed.
#
# [*nginx_upload_path*]
#   (Currently not enabled!) This value overrides the action set on the file
#   upload form, e.g. the web path where the nginx_upload_module has been
#   configured to intercept upload requests.
#
# [*upstream_gzip*]
#   If using compression in the upstream proxy server, use this option to
#   disable gzipping of library .tar.gz and .zip archives, since the proxy
#   server will do it faster on the fly.
#
# [*db_driver*]
#   Database driver to use. Use one of 'postgresql' or 'mysql'. Others have not been tested with this puppet module

# [*db_opts_pool_size*]
#   ???
#
# [*db_opts_max_overflow*]
#   ???
#
# [*enable_job_recovery*]
#   enable job recovery (if galaxy is restarted while cluster jobs are running,
#   it can "recover" them when it starts). this is not safe to use if you are
#   running more than one galaxy server using the same database.
#
# [*outputs_to_working_directory*]
#   if (for example) you run on a cluster and your datasets (by default,
#   database/files/) are mounted read-only, this option will override tool
#   output paths to write outputs to the working directory instead, and the job
#   manager will move the outputs to their proper place in the dataset
#   directory on the galaxy server after the job completes.
#
# [*retry_job_output_collection*]
#   integer representing number of time to retry. if your network filesystem's
#   caching prevents the galaxy server from seeing the job's stdout and stderr
#   files when it completes, you can retry reading these files. the job runner
#   will retry the number of times specified below, waiting 1 second between
#   tries. for nfs, you may want to try the -noac mount option (linux) or
#   -actimeo=0 (solaris).
#
# [*cleanup_job*]
#   clean up various bits of jobs left on the filesystem after completion.
#   these bits include the job working directory, external metadata temporary
#   files, and drm stdout and stderr files (if using a drm). possible values
#   are: always, onsuccess, never
#
# [*environment_setup_file*]
#   file to source to set up the environment when running jobs. by default,
#   the environment in which the galaxy server starts is used when running jobs
#   locally, and the environment set up per the drm's submission method and
#   policy is used when running jobs on a cluster (try testing with `qsub` on
#   the command line). environment_setup_file can be set to the path of a file
#   on the cluster that should be sourced by the user to set up the environment
#   prior to running tools. this can be especially useful for running jobs as
#   the actual user, to remove the need to configure each user's environment
#   individually. this only affects cluster jobs, not local jobs.
#
# [*cache_user_job_count*]
#   if using job concurrency limits (configured in job_config_file), several
#   extra database queries must be performed to determine the number of jobs a
#   user has dispatched to a given destination. by default, these queries will
#   happen for every job that is waiting to run, but if cache_user_job_count is
#   set to true, it will only happen once per iteration of the handler queue.
#   although better for performance due to reduced queries, the tradeoff is a
#   greater possibility that jobs will be dispatched past the configured limits
#
# [*use_amqp_server*]
#   Galaxy uses AMQ protocol to receive messages from external sources like bar
#   code scanners. Galaxy has been tested against RabbitMQ AMQP implementation.
#   For Galaxy to receive messages from a message queue the RabbitMQ server has
#   to be set up with a user account and other parameters listed below. The
#   'host' and 'port' fields should point to where the RabbitMQ server is
#   running.
#
# [*amqp_host*]
#
# [*amqp_port*]
#
# [*amqp_userid*]
#
# [*amqp_password*]
#
# [*amqp_virtual_host*]
#
# [*amqp_queue*]
#
# [*amqp_exchange*]
#
# [*amqp_routing_key*]
#
# [*amqp_ctl_path*]
#
# [*admin_email*]
#   Datasets in an error state include a link to report the error. Those
#   reports will be sent to this address. Error reports are disabled if no
#   address is set.
#
# [*admin_users*]
#   Administrative users - array of valid Galaxy users (email addresses).
#   These users will have access to the Admin section of the server, and will
#   have access to create users, groups, roles, libraries, and more. For more
#   information, see: http://wiki.g2.bx.psu.edu/Admin/Interface
#
# [*require_login*]
#   force everyone to log in (disable anonymous access).
#
# [*allow_user_creation*]
#   allow unregistered users to create new accounts (otherwise, they will have
#   to be created by an admin).
#
# [*allow_user_deletion*]
#   allow administrators to delete accounts.
#
# [*allow_user_impersonation*]
#   allow administrators to log in as other users (useful for debugging)
#
# [*allow_user_dataset_purge*]
#   allow users to remove their datasets from disk immediately (otherwise,
#   datasets will be removed after a time period specified by an administrator
#   in the cleanup scripts run via cron)
#
# [*new_user_dataset_access_role_default_private*]
#   by default, users' data will be public, but setting this to true will cause
#   it to be private. does not affect existing users and data, only ones
#   created after this option is set. users may still change their default
#   back to public.
#
# [*sanitize_all_html*]
#   By default, all tool output served as 'text/html' will be sanitized
#   thoroughly. This can be disabled if you have special tools that require
#   unaltered output.
#
# [*id_secret*]
#   Galaxy encodes various internal values when these values will be output in
#   some format (for example, in a URL or cookie). You should set a key to be
#   used by the algorithm that encodes and decodes these values. It can be any
#   string. If left unchanged, anyone could construct a cookie that would #   grant them access to others' sessions.
#   (Tip: use `openssl rand -hex 32` to generate one)
#
# [*remote_user*]
#   User authentication can be delegated to an upstream proxy server (usually
#   Apache). The upstream proxy should set a REMOTE_USER header in the request.
#   Enabling remote user disables regular logins. For more information, see:
#   http://wiki.g2.bx.psu.edu/Admin/Config/Apache%20Proxy
#
# [*remote_user_maildomain*]
#   If use_remote_user is enabled and your external authentication method just
#   returns bare usernames, set a default mail domain to be appended to
#   usernames, to become your Galaxy usernames (email addresses).
#
# [*remote_user_logout_href*]
#   If use_remote_user is enabled, you can set this to a URL that will log your
#   users out.
#
# [*enable_openid*]
#   enable authentication via openid.  allows users to log in to their galaxy
#   account by authenticating with an openid provider.
#
# [*openid_config_file*]
#   location of file to configure OAuth providers. TODO: allow configuration in galaxy
#
# [*enable_ftp_upload*]
#   enable galaxy's "upload via ftp" interface.  you'll need to install and
#   configure an ftp server (we've used proftpd since it can use galaxy's
#   database for authentication).
#
#   See the following:
#   https://wiki.galaxyproject.org/Admin/Config/Upload%20via%20FTP
#   https://wiki.galaxyproject.org/Admin/Config/ProFTPd_with_AD
#
# [*ftp_upload_dir*]
#   This should point to a directory containing subdirectories matching users'
#   email addresses, where galaxy will look for files.
#
# [*ftp_upload_site*]
#   This should be the hostname of your ftp server, which will be provided to
#   users in the help text.
#
# [*enable_quotas*]
#   Enable enforcement of quotas.  Quotas can be set from the admin interface.
#
# [*log_level*]
#   Verbosity of console log messages.  Acceptable values can be found here:
#   http://docs.python.org/library/logging.html#logging-levels
#
# [*database_engine_option_echo*]
#   Print database operations to the server log (warning, quite verbose!).
#
# [*database_engine_option_echo_pool*]
#   Print database pool operations to the server log (warning, quite verbose!).
#
# [*log_events*]
#   Turn on logging of application events and some user events to the database.
#
# [*log_actions*]
#   Turn on logging of user actions to the database. Actions currently logged
#   are grid views, tool searches, and use of "recently" used tools menu.  The
#   log_events and log_actions functionality will eventually be merged.
#
# [*debug_enable*]
#   Debug enables access to various config options useful for development and
#   debugging: use_lint, use_profile, use_printdebug and use_interactive.  It
#   also causes the files used by PBS/SGE (submission script, output, and
#   error) to remain on disk after the job is complete.  Debug mode is disabled
#   if commented, but is uncommented by default in the sample config.
#
# [*debug_wsgi_lint*]
#   Check for WSGI compliance.
#
# [*debug_use_profile*]
#   Run the Python profiler on each request.
#
# [*debug_use_printdebug*]
#   Intercept print statements and show them on the returned page.
#
# [*debug_use_interactive*]
#   Enable live debugging in your browser.  This should NEVER be enabled on a
#   public site.  Enabled in the sample config for development.
#
# [*debug_use_heartbeat*]
#   Write thread status periodically to 'heartbeat.log',  (careful, uses disk
#   space rapidly!).  Useful to determine why your processes may be consuming a
#   lot of CPU.
#
# [*debug_use_memdump*]
#   Enable the memory debugging interface (careful, negatively impacts server
#   performance).
#
# [*data_search_with_whoosh*]
#   Search data libraries with whoosh
#
# [*whoosh_index_dir*]
#   Whoosh indexes are stored in this directory.
#
# [*data_search_with_lucene*]
#   Search data libraries with lucene
#
# [*lucene_fulltext_max_size*]
#   maxiumum file size to index for searching, in MB
#
# [*lucene_fulltext_noindex_filetypes*]
#   Array of filetypes which should not be indexed.
#
# [*lucene_fulltext_url*]
#   base URL of server providing search functionality using lucene
#
# [*retry_metadata_internally*]
#   although it is fairly reliable, setting metadata can occasionally fail.  in
#   these instances, you can choose to retry setting it internally or leave it
#   in a failed state (since retrying internally may cause the galaxy process
#   to be unresponsive).  if this option is set to false, the user will be
#   given the option to retry externally, or set metadata manually (when
#   possible).
#
# [*cloud_enable_launch*]
#   Enable cloud launch
#
# [*cloud_ami*]
#   AMI id to use
#
# [*ui_branding*]
#   Append "/$ui_branding" to the "Galaxy" text in the masthead.
#
# [*ui_welcome_url*]
#   The URL of the page to display in Galaxy's middle pane when loaded. This
#   can be an absolute or relative URL.
#
# [*ui_logo_url*]
#   The URL linked by the "Galaxy/brand" text.
#
# [*ui_extra_wiki_url*]
#   The URL linked by the "Galaxy Wiki" link in the "Help" menu.
#
# [*ui_extra_support_url*]
#   The URL linked by the "Support" link in the "Help" menu.
#
# [*ui_extra_citation_url*]
#   The URL linked by the "How to Cite..." link in the "Help" menu.
#
# [*ui_extra_terms_url*]
#   The URL linked by the "Terms and Conditions" link in the "Help" menu, as
#   well as on the user registration and login forms.
#
# [*library_import_dir*]
#   Add an option to the library upload form which allows administrators to
#   upload a directory of files.
#
# [*user_library_import_dir*]
#   Add an option to the library upload form which allows authorized
#   non-administrators to upload a directory of files.  The configured
#   directory must contain sub-directories named the same as the non-admin
#   user's Galaxy login ( email ).  The non-admin user is restricted to
#   uploading files or sub-directories of files contained in their directory.
#
# [*allow_library_path_paste*]
#   Add an option to the admin library upload tool allowing admins to paste
#   filesystem paths to files and directories in a box, and these paths will be
#   added to a library.  Set to True to enable.  Please note the security
#   implication that this will give Galaxy Admins access to anything your
#   Galaxy user has access to.
#
# [*disable_library_comptypes*]
#   Users may choose to download multiple files from a library in an archive.
#   By default, Galaxy allows users to select from a few different archive
#   formats if testing shows that Galaxy is able to create files using these
#   formats.  Specific formats can be disabled with this option, separate more
#   than one format with commas.  Available formats are currently 'zip', 'gz',
#   and 'bz2'.
#
# [*use_transfer_manager*]
#   Some sequencer integration features in beta allow you to automatically
#   transfer datasets.  This is done using a lightweight transfer manager which
#   runs outside of Galaxy (but is spawned by it automatically).  Galaxy will
#   communicate with this manager over the port specified here.
#
# [*transfer_manager_port*]
#   See use_transfer_manager
#
# === Examples
#
#  galaxy::galaxy_ini { 'production':
#     ui_branding => "ACME",
#     remote_user => true,
#     remote_user_maildomain => "EXAMPLE.COM",
#     remote_user_logout_href => "None",
#  }
#
# === Authors
#
# Eric Rasche <rasche.eric@yandex.ru>
# O. Inizan <olivier.inizan@versailles.inra.fr>
# S. Bridel <sebastien.bridel@versailles.inra.fr>
#
# NOTE: The documentation was largely copied from `galaxy.ini`. A small
# portion of it was written by Eric Rasche where galaxy.ini was found
# insufficient. The author list would include all of those who had modified the
# file, were that faesible.
#
# === Copyright
#
# Copyright 2014, for the puppet code representing a galaxy.ini resource.
#
class galaxy::galaxy_ini(
  # Workers & Handlers Configuration
  $wk_config = false,

  $number_of_web_workers          = 4,
  $webworker_starting_port_number = 8000,
  $webworker_host_to_listen_on    = '0.0.0.0',
  $webworker_threadpool_workers   = 5,

  $number_of_background_workers = 4,
  $handler_host_to_listen_on    = '0.0.0.0',
  $handler_threadpool_workers   = 5,

  # Server Main Configuration
  $main_host = '0.0.0.0',

  # Proxying
  $use_prefix   = true,
  $proxy_prefix = '/galaxy',

  # Filters
  $filters = [
    { type => "tool_section_filters", python_class => 'galaxy:admin' }
  ],

  # Paths
  $tool_conf_file      = "config/tool_conf.xml.sample",
  $shed_tool_conf_file = "config/shed_tool_conf.xml.sample",
  $job_config_file     = 'job_conf.xml',


  ## Backend Configuration ##
  # Web server
  $webserver           = 'apache',
  $xsendfile           = true,
  $x_accel_redirect    = true,
  $x_archive_files     = true,
  #$nginx_upload_store = '',
  #$nginx_upload_path  = '',
  $upstream_gzip       = true,

  # Database
  $db_connection        = 'sqlite:///./database/local.sqlite?isolation_level=IMMEDIATE',
  $db_driver            = 'sqlite',
  $db_opts_pool_size    = 500,
  $db_opts_max_overflow = 1000,

  ## Cluster Options ##
  $enable_job_recovery          = true,
  $outputs_to_working_directory = false,
  $retry_job_output_collection  = 0,
  $cleanup_job                  = onsuccess,
  $environment_setup_file       = 'None',
  $cache_user_job_count         = false,

  ## AMQP Server ##
  $use_amqp_server   = false,
  $amqp_host         = '127.0.0.1',
  $amqp_port         = 5672,
  $amqp_userid       = 'galaxy',
  $amqp_password     = 'galaxy',
  $amqp_virtual_host = 'galaxy_messaging_engine',
  $amqp_queue        = 'galaxy_queue',
  $amqp_exchange     = 'galaxy_exchange',
  $amqp_routing_key  = 'bar_code_scanner',
  $amqp_ctl_path     = '/path/to/rabbitmqctl',

  ## Administration  and Security##
  # Admin Users
  $admin_email              = "root@localhost",
  $admin_users              = [],
  $require_login            = false,
  $allow_user_creation      = true,
  $allow_user_deletion      = true,
  $allow_user_impersonation = true,
  $allow_user_dataset_purge = true,
  $new_user_dataset_access_role_default_private = true,

  # Security
  $sanitize_all_html = true,
  $id_secret = 'my-secret-random-id',

  ## Authentication ##
  # Remote User Config
  $remote_user             = false,
  $remote_user_maildomain  = 'UNIVERSITY.EDU',
  $remote_user_logout_href = 'https://sso.university.edu/logout',

  # Open ID
  $enable_openid      = false,
  $openid_config_file = 'openid_conf.xml',

  ## Access and Data ##
  # FTP
  $enable_ftp_upload = true,
  $ftp_upload_site   = $fqdn,

  # Quotas
  $enable_quotas = true,

  ## Debug ##
  $log_level = 'INFO',
  $database_engine_option_echo      = false,
  $database_engine_option_echo_pool = false,
  $log_events            = false,
  $log_actions           = false,
  $debug_enable          = false,
  $debug_wsgi_lint       = false,
  $debug_use_profile     = false,
  $debug_use_printdebug  = false,
  $debug_use_interactive = false,
  $debug_use_heartbeat   = false,
  $debug_use_memdump     = false,

  ## Search ##
  # Whoosh
  $data_search_with_whoosh = false,

  # Lucene
  $data_search_with_lucene           = false,
  $lucene_fulltext_max_size          = 500,
  $lucene_fulltext_noindex_filetypes = ['bam','sam','wig','bigwig','fasta','fastq','fastqsolexa','fastqillumina','fastqsanger'],
  $lucene_fulltext_url               = 'https://localhost/lucene/',

  ## OTHER ##
  # MISC
  $retry_metadata_internally = true,

  # Cloud Settings
  $cloud_enable_launch = false,
  $cloud_ami           = 'ami-118bfc78',

  # Branding
  $ui_branding    = $name,
  $ui_welcome_url = '/static/welcome.html',
  $ui_logo_url    = '/',

  # URLs
  $ui_extra_wiki_url     = 'http://wiki.g2.bx.psu.edu/',
  $ui_extra_support_url  = 'http://wiki.g2.bx.psu.edu/Support',
  $ui_extra_citation_url = 'http://wiki.g2.bx.psu.edu/Citing%20Galaxy',
  $ui_extra_terms_url    = 'None',

  # Libraries
  $library_import_dir        = 'None',
  $user_library_import_dir   = 'None',
  $allow_library_path_paste  = false,
  $disable_library_comptypes = [],

  # Transfer Manager
  $use_transfer_manager  = false,
  $transfer_manager_port = 10000,
){
  $galaxy_ini			      = "/home/galaxy/galaxy-dist/config/galaxy.ini"
  $handler_starting_port_number       = $webworker_starting_port_number+$number_of_background_workers
  $number_of_background_workers_array = range("0", -1+$number_of_background_workers)
  $number_of_web_workers_array        = range("0", -1+$number_of_web_workers)

  if($id_secret == 'my-secret-random-id'){
    fail('You must specify a random secret ID for this galaxy instance. This should be unique to each galaxy instance.')
  }

  require galaxy::directories
  $tmp_file_dir        = $galaxy::directories::tmp_file
  $file_path           = $galaxy::directories::file_path
  $tool_dependency_dir = $galaxy::directories::tool_dependency
  $cluster_files_dir   = $galaxy::directories::cluster_files
  $job_working_dir     = $galaxy::directories::job_working
  $whoosh_index_dir    = $galaxy::directories::whoosh_index
  $ftp_upload_dir      = $galaxy::directories::ftp

  file { $galaxy_ini:
    require => Class['galaxy::install'],
    content => template("galaxy/universe_wsgi.ini.erb"),
    owner   => 'galaxy',
    group   => 'galaxy',
  }
}
