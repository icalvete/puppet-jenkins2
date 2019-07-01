class jenkins2::plugins {

  if is_array($jenkins2::plugins) {
    $plugins = split(inline_template("<%= (scope.lookupvar('jenkins2::plugins')+scope.lookupvar('jenkins2::params::plugins')).join(',') %>"),',')
  } else {
    $plugins = $jenkins2::params::plugins
  }

  jenkins2::plugin{$plugins:}
}
