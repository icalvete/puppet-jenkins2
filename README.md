# puppet-jenkins2

Puppet manifest to install and configure Jenkins2

[![Build Status](https://secure.travis-ci.org/icalvete/puppet-jenkins2.png)](http://travis-ci.org/icalvete/puppet-jenkins2)

See [Jenkins site](http://jenkins-ci.org/)

## Requires:

* [hiera](http://docs.puppetlabs.com/hiera/1/index.html)

## Usage

```puppet
  class {'roles::jenkins_server':
    url        => ''ci.example.net,
    ssl        => true,
    keystore   => 'puppet:///modules/cg_common/ssl/jenkins_keystore.jks'
  }
```

### Generate a JKS

In this example the cert it's a wildcard. In other case use the FQDN.

```
icalvete@dagon ~/puppet-jenkins$ cd files/tools
icalvete@dagon ~/puppet-jenkins/files/tools$./create_PKCS12.sh cg.key cg.crt ca_intermediate.crt *.cremagames.com
icalvete@dagon ~/puppet-jenkins/files/tools$./create_JKS.sh *.cremagames.com
```


## Authors:

Israel Calvete Talavera <icalvete@gmail.com>
