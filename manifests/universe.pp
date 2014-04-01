define galaxy::universe(
  directory = $galaxy::params::directory,

  # Worker Configuration
  $number_of_background_workers = range("0","4"),
  $handler_starting_port_number = 8000,
  $handler_host_to_listen_on = "0.0.0.0",
  $handler_threadpool_workers = 5,

  $number_of_web_workers = range("0","4"),
  $webworker_starting_port_number = 8000+size($number_of_background_workers),
  $webworker_host_to_listen_on = "0.0.0.0",
  $webworker_threadpool_workers = 5,

  # Proxying
  $use_prefix = true,
  $proxy_prefix = "/galaxy",

  # Filters
  $filters = [
    { type => "tool_section_filters", python_class => "galaxy:admin" }
  ],

  # Paths
  $tmp_file_dir = 'database/tmp',
  $file_path = 'database/files',
  $tool_dependency_dir = "$directory/tool_dependencies",
  $tool_config_files = ['tool_conf.xml','shed_tool_conf.xml'],
  $job_config_file = 'job_conf.xml',


  ## Backend Configuration ##
  # Web server
  $webserver = 'apache',
  $xsendfile = true,
  $upstream_gzip = true,
  $x_accel_redirect = true,
  $x_archive_files = true,
  #$nginx_upload_store = '',
  #$nginx_upload_path = '',

  # Database 
  $db_driver = 'postgresql',
  $db_username = 'galaxy',
  $db_password = 'my-secure-password',
  $db_host = 'localhost',
  $db_port = 5432,
  $db_database = 'galaxydb',

  $db_opts_pool_size = 500M,
  $db_opts_max_overflow = 1000,


  ## Cluster Options ##
  $enable_job_recovery = true,
  $outputs_to_working_directory = false,
  $retry_job_output_collection = 0,
  $cleanup_job = onsuccess,
  $environment_setup_file = 'None',
  $cache_user_job_count = false,

  ## AMQP Server ##
  $use_amqp_server = false,
  $amqp_host = '127.0.0.1',
  $amqp_port = 5672,
  $amqp_userid = 'galaxy',
  $amqp_password = 'galaxy',
  $amqp_virtual_host = 'galaxy_messaging_engine',
  $amqp_queue = 'galaxy_queue',
  $amqp_exchange = 'galaxy_exchange',
  $amqp_routing_key = 'bar_code_scanner',
  $amqp_ctl_path = '/path/to/rabbitmqctl',

  ## Administration  and Security##

  # Admin Users
  $admin_email = "root@localhost",
  $admin_users = [],
  $require_login = true,
  $allow_user_creation = true,
  $allow_user_deletion = true,
  $allow_user_impersonation = true,
  $allow_user_dataset_purge = true,
  $new_user_dataset_access_role_default_private = true,

  # Security
  $sanitize_all_html = true,
  $id_secret = 'my-secret-random-id',


  ## Authentication ##
  # Remote User Config
  $remote_user = false,
  $remote_user_maildomain = 'UNIVERSITY.EDU',
  $remote_user_maildomain = 'https://sso.university.edu/logout',

  # Open ID
  $enable_openid = false,
  $openid_config_file = 'openid_conf.xml',


  ## Access and Data ##

  # FTP
  $enable_ftp_upload = true,
  $ftp_upload_dir = "$directory/database/ftp/",
  $ftp_upload_site = $fqdn,
  
  # Quotas
  $enable_quotas = true,


  ## Debug ##
  $log_level = 'INFO',
  $database_engine_option_echo = false,
  $database_engine_option_echo_pool = false,
  $log_events = false,
  $log_actions = false,

  $debug_enable = false,
  $debug_wsgi_lint = false,
  $debug_use_profile = false,
  $debug_use_printdebug = false,
  $debug_use_interactive = false,
  $debug_use_heartbeat = false,
  $debug_use_memdump = false,


  ## Search ##
  # Whoosh
  $data_search_with_whoosh = false,
  $whoosh_index_dir = 'database/whoosh_indexes',

  $data_search_with_lucene = false,
  $lucene_fulltext_max_size = 500,
  $lucene_fulltext_noindex_filetypes = ['bam','sam','wig','bigwig','fasta','fastq','fastqsolexa','fastqillumina','fastqsanger'],
  $lucene_fulltext_url = 'https://localhost/lucene/',
  
  
  ## OTHER ## 

  # MISC
  $retry_metadata_internally = true,

  # Cloud Settings
  $cloud_enable_launch = false,
  $cloud_ami = 'ami-118bfc78',

  # Branding
  $ui_branding = $name,
  $ui_welcome_url = '/static/welcome.html',
  $ui_logo_url = '/',

  # URLs
  $ui_extra_wiki_url = 'http://wiki.g2.bx.psu.edu/',
  $ui_extra_support_url = 'http://wiki.g2.bx.psu.edu/Support',
  $ui_extra_citation_url = 'http://wiki.g2.bx.psu.edu/Citing%20Galaxy',

  # Libraries
  $library_import_dir = 'None',
  $user_library_import_dir = 'None',
  $allow_library_path_paste = false,
  $disable_library_comptypes = [],

  # Transfer Manager
  $use_transfer_manager = false,
  $transfer_manager_port = 10000,


){


  file { "$directory/universe_wsgi.ini":
    content => template("galaxy/universe_wsgi.ini.erb"),
  }

}
