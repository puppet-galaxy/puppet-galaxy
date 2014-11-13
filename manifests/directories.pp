#
#
#
#
#
#
class galaxy::directories(
  $tmp_file            = '/home/galaxy/galaxy-dist/database/tmp',
  $file_path           = '/home/galaxy/galaxy-dist/database/files',
  $cluster_files       = '/home/galaxy/galaxy-dist/database/pbs',
  $job_working         = '/home/galaxy/galaxy-dist/database/job_working_directory',
  $whoosh_index        = '/home/galaxy/galaxy-dist/database/whoosh_indexes',
  $ftp                 = '/home/galaxy/galaxy-dist/database/ftp/',
  $compiled_templates  = '/home/galaxy/galaxy-dist/database/compiled_templates',
  $object_store_object = '/home/galaxy/galaxy-dist/database/object_store_object',
  $object_store_cache  = '/home/galaxy/galaxy-dist/database/object_store_cache',
  $tool_dependency     = '/home/galaxy/galaxy-dist/tool_dependencies',
  $tool_data_jars      = '/home/galaxy/galaxy-dist/tool-data/shared/jars',
){
  $paths= [
    "$tmp_file",
    "$file_path",
    "$cluster_files",
    "$job_working",
    "$whoosh_index",
    "$ftp",
    "$compiled_templates",
    "$object_store_object",
    "$object_store_cache",
    "$tool_dependency",
    "$tool_data_jars",
    '/home/galaxy/galaxy-dist/static/genetrack/plots',
  ]
 file  { $paths:
    before => Class['galaxy::galaxy_ini'],
    ensure => directory,
    owner  => 'galaxy',
    group  => 'galaxy',
    mode   => '0755',
  }
}
