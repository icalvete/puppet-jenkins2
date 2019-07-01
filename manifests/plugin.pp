define jenkins2::plugin($version=0) {

  $plugin            = "${name}.hpi"
  $plugin_parent_dir = $jenkins2::params::plugin_parent_dir
  $plugin_dir        = $jenkins2::params::plugin_dir

  if ($version != 0) {
    $base_url = "http://updates.jenkins-ci.org/download/plugins/${name}/${version}/"
  }
  else {
    $base_url = 'http://updates.jenkins-ci.org/latest/'
  }

  exec {"jenkins_get_plugin_${name}" :
    command => "/usr/bin/wget --no-check-certificate ${base_url}${plugin}",
    cwd     => $plugin_dir,
    user    => 'jenkins',
    unless  => "/usr/bin/test -d ${plugin_dir}/${name}",
    notify  => Service[$jenkins2::params::service],
    require => File[$plugin_dir],
  }
}
