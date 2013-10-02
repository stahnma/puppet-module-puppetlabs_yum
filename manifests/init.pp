# Class puppetlabs
#
# Actions:
#   Configure the proper repositories and import GPG keys
#
# Reqiures:
#   You should probably be on an Enterprise Linux variant. (Centos, RH${ostype},
#     Scientific, Oracle, Ascendos, et al)
#
# Sample Usage:
#  include puppetlabs
#
class puppetlabs_yum (
  $enable_devel = false
) inherits puppetlabs_yum::params {

  if $::pper_installed == 'false' or $::pper_installed == undef {

    if $::osfamily == 'RedHat' {
      include puppetlabs_yum::products
      include puppetlabs_yum::deps
      class { 'puppetlabs_yum::devel':
        enable_devel   => $enable_devel,
      }

      puppetlabs_yum::rpm_gpg_key{ 'RPM-GPG-KEY-puppetlabs':
        path => '/etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs',
      }

      file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs':
        ensure => present,
        owner  => 0,
        group  => 0,
        mode   => '0644',
        source => 'puppet:///modules/puppetlabs_yum/RPM-GPG-KEY-puppetlabs',
      }

      } else {
        notice ("Your operating system ${::operatingsystem} will not have Puppet Labs Yum repository configured")
      }
  }
  else {
    notice('Not installing puppetlabs_yum because you have Puppet Enterprise installed')
  }

}
