# Devel repos.  This actually means rc previews, pre-release softare, etc
class puppetlabs_yum::devel  (
  $enable_devel = false
) inherits puppetlabs_yum::params {

  if $enable_devel {
    $enabled = 1
  } else {
    $enabled = 0
  }

  yumrepo { 'puppetlabs-devel':
    baseurl  => "http://yum.puppetlabs.com/${urlbit}/devel/${::architecture}",
    descr    => "Puppet Labs Devel ${ostype} ${::os_maj_version} - ${::architecture}",
    enabled  => "${enabled}",
    gpgcheck => '1',
    gpgkey   => 'file:///yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs',
  }

  yumrepo { 'puppetlabs-devel-source':
    baseurl  => "http://yum.puppetlabs.com/${urlbit}/devel/SRPMS",
    descr    => "Puppet Labs Devel ${ostype} ${::os_maj_version} - Source",
    enabled  => "${enabled}",
    gpgcheck => '1',
    gpgkey   => 'file:///yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs',
  }

}
