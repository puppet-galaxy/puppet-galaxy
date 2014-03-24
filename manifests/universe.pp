define galaxy::universe(
  directory = $galaxy::params::directory,
  $number_of_background_workers = range("0","4"),
  $handler_starting_port_number = 8000,
  $handler_host_to_listen_on = "0.0.0.0",
  $handler_threadpool_workers = 5,

  $number_of_web_workers = range("0","4"),
  $webworker_starting_port_number = 8000+size($number_of_background_workers),
  $webworker_host_to_listen_on = "0.0.0.0",
  $webworker_threadpool_workers = 5,

  $use_prefix = true,
  $proxy_prefix = "/galaxy",

  $filters = [
    { type => "tool_section_filters", python_class => "galaxy:admin" }
  ],

  $db_driver = 'postgresql',
  $db_username = 'galaxy',
  $db_password = 'my-secure-password',
  $db_host = 'localhost',
  $db_port = 5432,
  $db_database = 'galaxydb',

  $db_opts_pool_size = 500M,
  $db_opts_max_overflow = 1000,

  $tool_config_files = ['tool_conf.xml','shed_tool_conf.xml'],

  $tmp_file_dir = 'database/tmp',
  $file_path = 'database/files',

  $tool_dependency_dir = "$directory/tool_dependencies",

  $admin_email = "root@localhost",

  $ui_branding = $name,
  $ui_welcome_url = '/static/welcome.html',
  $ui_logo_url = '/',

  $ui_extra_wiki_url = 'http://wiki.g2.bx.psu.edu/',
  $ui_extra_support_url = 'http://wiki.g2.bx.psu.edu/Support',
  $ui_extra_citation_url = 'http://wiki.g2.bx.psu.edu/Citing%20Galaxy',

  #$cloud_ami = 'ami-118bfc78'

  $webserver = 'apache',
  $xsendfile = true,
  $upstream_gzip = true,

  $log_level = 'INFO',
  $database_engine_option_echo = 'False',
  $database_engine_option_echo_pool = 'False',
  $log_events = 'False',
  $log_actions = 'False',
  $sanitize_all_html = 'True',
  $debug_enable = 'False',
  $debug_wsgi_lint = 'False',
  $debug_use_profile = 'False',
  $debug_use_printdebug = 'False',
  $debug_use_interactive = 'False',
  $debug_use_heartbeat = 'False',
  $debug_use_memdump = 'False',


  $library_import_dir = 'None',
  $user_library_import_dir = 'None',
  $allow_library_path_paste = 'False',

  #$disable_library_comptypes = ['gz','bz2']

  $data_search_with_lucene = 'False',
  $lucene_fulltext_max_size = 500,
  $lucene_fulltext_noindex_filetypes = ['bam','sam','wig','bigwig','fasta','fastq','fastqsolexa','fastqillumina','fastqsanger'],
  $lucene_fulltext_url = 'https://localhost/lucene/',


  # TODO, figure out how to generate from name + hostname + other info?
  $id_secret = 'my-secret-random-id',

  $remote_user = 'True',
  $remote_user_maildomain = 'UNIVERSITY.EDU',
  $remote_user_maildomain = 'https://sso.university.edu/logout',

  #$admin_users = ['j.doe@UNIVERSITY.EDU'],
  $require_login = 'True',
  $allow_user_creation = 'True',
  $allow_user_deletion = 'True',
  $allow_user_impersonation = 'True',
  $allow_user_dataset_purge = 'True',
  $new_user_dataset_access_role_default_private = 'False',

  $ftp_upload_dir = "$directory/database/ftp/",
  $ftp_upload_site = $fqdn
){


  file { "$directory/universe_wsgi.ini":
    content => template("galaxy/universe_wsgi.ini.erb"),
  }

}
