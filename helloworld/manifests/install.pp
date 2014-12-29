# == Class helloworld::install
#
class helloworld::install {

  package { $helloworld::package_name:
    ensure => present,
  }
}
