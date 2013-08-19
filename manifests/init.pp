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
#  include puppetlabs_yum
#
class puppetlabs_yum (
  $enable_devel = false,
  $urlprefix_products    = 'http://yum.puppetlabs.com/',
  $urlprefix_productssrc = 'http://yum.puppetlabs.com/',
  $urlprefix_deps        = 'http://yum.puppetlabs.com/',
  $urlprefix_depssrc     = 'http://yum.puppetlabs.com/',
  $urlprefix_devel       = 'http://yum.puppetlabs.com/',
  $urlprefix_develsrc    = 'http://yum.puppetlabs.com/',
) inherits puppetlabs_yum::params {

  if $::pper_installed == 'false' or $::pper_installed == undef {

    if $::osfamily == 'RedHat' {
      class { 'puppetlabs_yum::products':
        url_prefix    => $urlprefix_products,
        url_prefixsrc => $urlprefix_productssrc,
      }
      class { 'puppetlabs_yum::deps':
        url_prefix    => $urlprefix_deps,
        url_prefixsrc => $urlprefix_depssrc,
      }
      class { 'puppetlabs_yum::devel':
        enable_devel   => $enable_devel,
        url_prefix    => $urlprefix_devel,
        url_prefixsrc => $urlprefix_develsrc,
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
