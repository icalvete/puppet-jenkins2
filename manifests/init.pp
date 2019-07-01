class jenkins2 (

  $repo_scheme   = $jenkins2::params::repo_scheme,
  $repo_domain   = $jenkins2::params::repo_domain,
  $repo_port     = $jenkins2::params::repo_port,
  $repo_user     = $jenkins2::params::repo_user,
  $repo_pass     = $jenkins2::params::repo_pass,
  $repo_path     = $jenkins2::params::repo_path,
  $repo_resource = $jenkins2::params::repo_resource,
  $plugins       = undef,
  $ssl           = false,
  $skey          = $jenkins2::params::skey,
  $keystore      = $jenkins2::params::keystore,
  $sonar         = false,
  $email         = $jenkins2::params::email,
  $url           = undef

) inherits jenkins2::params {

  if ! $repo_resource {
    fail('repo_resource parameter must be defined')
  }

  anchor{'jenkins2::begin':
    before  => Class['jenkins2::install']
  }
  class{'jenkins2::install':
    require => Anchor['jenkins2::begin']
  }
  class{'jenkins2::config':
    require => Class['jenkins2::install'],
    notify  => Class['jenkins2::service']
  }
  class{'jenkins2::plugins':
    require => Class['jenkins2::config'],
    notify  => Class['jenkins2::service']
  }
  class{'jenkins2::service':
    require  => Class['jenkins2::plugins']
  }

  anchor{'jenkins2::end':
    require => Class['jenkins2::service']
  }
}
