# == Class helloworld::params
#
# This class is meant to be called from helloworld
# It sets variables according to platform
#
class helloworld::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'helloworld'
      $service_name = 'helloworld'
    }
    'RedHat', 'Amazon': {
      $package_name = 'helloworld'
      $service_name = 'helloworld'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
