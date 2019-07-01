class jenkins2::service {

  service { $jenkins2::params::service:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}

