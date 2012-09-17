# Devel repos.  This actually means rc previews, pre-release softare, etc
class puppetlabs_yum::devel inherits puppetlabs_yum::params {

  yumrepo { 'puppetlabs-devel':
    baseurl  => "http://yum.puppetlabs.com/${urlbit}/devel/${::architecture}",
    descr    => "Puppet Labs Devel ${ostype} ${::os_maj_version} - ${::architecture}",
    enabled  => '0',
    gpgcheck => '1',
    gpgkey   => 'file:///yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs',
  }

  yumrepo { 'puppetlabs-devel-source':
    baseurl  => "http://yum.puppetlabs.com/${urlbit}/devel/SRPMS",
    descr    => "Puppet Labs Devel ${ostype} ${::os_maj_version} - Source",
    enabled  => '0',
    gpgcheck => '1',
    gpgkey   => 'file:///yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs',
  }

}
