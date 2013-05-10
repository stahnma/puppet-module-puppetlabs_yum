# Deps are things puppet labs product need to pull in for dependency
#  resolution.  Ideally you won't need EPEL or somet other repository with Puppet
#  Labs Product + Deps.
class puppetlabs_yum::deps inherits puppetlabs_yum::params {

  yumrepo { 'puppetlabs-deps':
    baseurl  => "http://yum.puppetlabs.com/${params::urlbit}/dependencies/${::architecture}",
    descr    => "Puppet Labs Dependencies ${params::ostype} ${::os_maj_version} - ${::architecture}",
    enabled  => '1',
    gpgcheck => '1',
    gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs',
  }
  yumrepo { 'puppetlabs-deps-source':
    baseurl  => "http://yum.puppetlabs.com/${params::urlbit}/dependencies/SRPMS",
    descr    => "Puppet Labs Source Dependencies ${params::ostype} ${::os_maj_version} - ${::architecture} - Source",
    enabled  => '0',
    gpgcheck => '1',
    gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs',
  }
}
