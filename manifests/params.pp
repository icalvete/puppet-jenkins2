class jenkins2::params {

  $repo_scheme            = 'http'
  $repo_domain            = 'pkg.jenkins-ci.org'
  $repo_port              = false
  $repo_user              = false
  $repo_pass              = false
  $repo_path              = 'debian/binary'
  $repo_resource          = 'jenkins_2.265_all.deb'

  $jenkins_plugins = [
    'apache-httpcomponents-client-4-api',
    'credentials',
    'git',
    'git-client',
    'github',
    'github-api',
    'github-branch-source',
    'git-server',
    'greenballs',
    'htmlpublisher',
    'jsch',
    'okhttp-api',
    'plain-credentials',
    'postbuild-task',
    'scm-api',
    'sonar',
    'ssh-credentials',
    'structs',
    'token-macro',
    'workflow-scm-step'
  ]

  $port              = hiera('jenkins_port', '8008')
  $sport             = hiera('jenkins_sport', '8084')
  $plugins           = hiera('jenkins_plugins', $jenkins_plugins)
  $service           = 'jenkins'
  $config_path       = '/var/lib/jenkins'
  $user              = 'jenkins'
  $plugin_parent_dir = '/var/lib/jenkins'
  $plugin_dir        = '/var/lib/jenkins/plugins'
  $skey              = hiera('jenkins_skey', 'j3nk1nsk3y')
  $keystore          = "puppet:///modules/${module_name}/keystore"
  $email             = 'address not configured yet &lt;nobody@nowhere&gt;'

  case $::operatingsystem {
    /^(Debian|Ubuntu)$/: {
      $installer            = '/usr/bin/dpkg'
      $group                = 'jenkins'
      $config_file_defaults = '/etc/default/jenkins'
    }
    default: {
      fail ("${::operatingsystem} not supported.")
    }
  }
}
