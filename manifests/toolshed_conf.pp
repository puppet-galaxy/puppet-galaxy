define galaxy::toolshed_conf (
  directory = $galaxy::params::directory,
  $default_toolsheds = [
    { name => 'Galaxy main tool shed', url => 'http://toolshed.g2.bx.psu.edu/' },
    { name => 'Galaxy test tool shed', url => 'http://testtoolshed.g2.bx.psu.edu/' }
  ],
  $custom_toolsheds = [],
){
  file { "$directory/tool_sheds_conf.xml":
    content => template("galaxy/tool_sheds_conf.xml.erb"),
  }

}
