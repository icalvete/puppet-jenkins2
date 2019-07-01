class jenkins2::params {

  $repo_scheme            = 'http'
  $repo_domain            = 'pkg.jenkins-ci.org'
  $repo_port              = false
  $repo_user              = false
  $repo_pass              = false
  $repo_path              = 'debian/binary'
  $repo_resource          = 'jenkins_2.178_all.deb'

  $jenkins_plugins = [
    'ace-editor',
    'ant',
    'antisamy-markup-formatter',
    'apache-httpcomponents-client-4-api',
    'authentication-tokens',
    'bitbucket',
    'bouncycastle-api',
    'branch-api',
    'build-timeout',
    'build-token-trigger',
    'cloudbees-folder',
    'command-launcher',
    'conditional-buildstep',
    'credentials',
    'credentials-binding',
    'display-url-api',
    'docker-commons',
    'docker-workflow',
    'durable-task',
    'email-ext',
    'git',
    'git-client',
    'github',
    'github-api',
    'github-branch-source',
    'git-server',
    'gradle',
    'greenballs',
    'handlebars',
    'htmlpublisher',
    'jackson2-api',
    'jdk-tool',
    'jquery-detached',
    'jsch',
    'junit',
    'ldap',
    'lockable-resources',
    'maven-plugin',
    'mailer',
    'mapdb-api',
    'matrix-auth',
    'matrix-project',
    'mercurial',
    'momentjs',
    'notification',
    'pam-auth',
    'parameterized-trigger',
    'pipeline-build-step',
    'pipeline-github-lib',
    'pipeline-graph-analysis',
    'pipeline-input-step',
    'pipeline-milestone-step',
    'pipeline-model-api',
    'pipeline-model-declarative-agent',
    'pipeline-model-definition',
    'pipeline-model-extensions',
    'pipeline-rest-api',
    'pipeline-stage-step',
    'pipeline-stage-tags-metadata',
    'pipeline-stage-view',
    'plain-credentials',
    'postbuild-task',
    'resource-disposer',
    'run-condition',
    'scm-api',
    'script-security',
    'sonar',
    'ssh-credentials',
    'ssh-slaves',
    'structs',
    'subversion',
    'timestamper',
    'token-macro',
    'workflow-aggregator',
    'workflow-api',
    'workflow-basic-steps',
    'workflow-cps',
    'workflow-cps-global-lib',
    'workflow-durable-task-step',
    'workflow-job',
    'workflow-multibranch',
    'workflow-scm-step',
    'workflow-step-api',
    'workflow-support',
    'ws-cleanup',
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
