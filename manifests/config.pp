class jenkins2::config {

  $plugin_dir        = $jenkins2::plugin_dir
  $plugin_parent_dir = $jenkins2::params::plugin_parent_dir

  if (!defined(File[$plugin_dir])) {
    file {[$plugin_parent_dir, $plugin_dir]:
      ensure => directory,
      owner  => $jenkins2::params::user,
      group  => $jenkins2::params::group,
    }
  }

  file{'jenkins_defaults_configuration':
    ensure  => present,
    content => template("${module_name}/jenkins_defaults.erb"),
    path    => $jenkins2::params::config_file_defaults,
    owner   => $jenkins2::params::user,
    group   => $jenkins2::params::group,
    mode    => '0644',
  }

  file{'jenkins_jenkins.model.JenkinsLocationConfiguration':
    ensure  => present,
    content => template("${module_name}/jenkins.model.JenkinsLocationConfiguration.xml.erb"),
    path    => "${jenkins2::params::config_path}/jenkins.model.JenkinsLocationConfiguration.xml",
    owner   => $jenkins2::params::user,
    group   => $jenkins2::params::group,
    mode    => '0644',
    backup  => true
  }

  $jenkins2_install_state_name_changes = [
    "defnode ien installStateName ''",
    "set \$ien/#text RUNNING"
  ]

  augeas{'jenkins2_install_state_name' :
    incl    => "${jenkins2::params::config_path}/config.xml",
    context => "/files/${jenkins2::params::config_path}/config.xml/hudson",
    lens    => 'Xml.lns',
    changes => $jenkins2_install_state_name_changes,
    notify  => Service[$jenkins2::params::service]
  }

  if $jenkins2::ssl {
    file {'jenkins_keystore':
      ensure => present,
      source => $jenkins2::keystore,
      path   => "${jenkins2::params::config_path}/.keystore",
      owner  => $jenkins2::params::user,
      group  => $jenkins2::params::group,
      mode   => '0644',
    }
  }
}
