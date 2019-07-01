class jenkins2::install {

  realize Package['daemon']

  include ::java

  $source = "${jenkins2::repo_scheme}://${jenkins2::repo_domain}/${jenkins2::repo_path}/${jenkins2::repo_resource}"

  wget::fetch {'jenkins_get_package':
    source      => $source,
    user        => $jenkins2::repo_user,
    password    => $jenkins2::repo_pass,
    destination => "/tmp/${jenkins2::repo_resource}",
    timeout     => 0,
    verbose     => false,
  }

  exec {'jenkins_install_package':
    cwd     => '/tmp/',
    command => "${jenkins2::params::installer} -i ${jenkins2::repo_resource}",
    require => Wget::Fetch['jenkins_get_package'],
    unless  => "/usr/bin/test -d ${jenkins2::params::config_path}"
  }
}

