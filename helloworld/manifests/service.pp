# == Class helloworld::service
#
# This class is meant to be called from helloworld
# It ensure the service is running
#
class helloworld::service {

  service { $helloworld::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
