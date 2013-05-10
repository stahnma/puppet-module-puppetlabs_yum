# Devel repos.  This actually means rc previews, pre-release softare, etc
class puppetlabs_yum::devel  (
  $enable_devel = false
) inherits puppetlabs_yum::params {

  if $enable_devel {
    $enabled = '1'
  } else {
    $enabled = '0'
  }

  yumrepo { 'puppetlabs-devel':
    baseurl  => "http://yum.puppetlabs.com/${params::urlbit}/devel/${::architecture}",
    descr    => "Puppet Labs Devel ${params::ostype} ${::os_maj_version} - ${::architecture}",
    enabled  => $enabled,
    gpgcheck => '1',
    gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs',
  }

  yumrepo { 'puppetlabs-devel-source':
    baseurl  => "http://yum.puppetlabs.com/${params::urlbit}/devel/SRPMS",
    descr    => "Puppet Labs Devel ${params::ostype} ${::os_maj_version} - ${::architecture} - Source",
    enabled  => $enabled,
    gpgcheck => '1',
    gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs',
  }

}
