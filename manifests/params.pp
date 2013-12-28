# Optional parameters in setting up Puppet Labs Yum repository
class puppetlabs_yum::params {
  # Setting to 'absent' will fall back to the yum.conf
  # Setting proxy here will be the default for all repos.
  #
  #  If you wish to set a proxy for an individual set of repos,
  #   you can declare $proxy in that class, and should scope to
  #   the most specific declaration of proxy.
  $proxy = 'absent'


  # There are some URL manipulations that have to happen based on exact OS type
  if $::osfamily == 'RedHat' {
    if $::operatingsystem == 'Fedora' {
      $ostype = 'Fedora'
      $urlbit = 'fedora/f$releasever'
    } else {
      $ostype = 'EL'
      $urlbit = 'el/$releasever'
    }
  }
}
