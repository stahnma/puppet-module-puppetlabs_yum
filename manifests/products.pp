# Products include puppet, facter, mcollective, puppetdb, etc
class puppetlabs_yum::products inherits puppetlabs_yum::params {

  yumrepo { 'puppetlabs-products':
    baseurl  => "http://yum.puppetlabs.com/${urlbit}/products/${::architecture}",
    descr    => "Puppet Labs Products ${ostype} ${::os_maj_version} - ${::architecture}",
    enabled  => '1',
    gpgcheck => '1',
    gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs',
  }

  yumrepo { 'puppetlabs-products-source':
    baseurl        => "http://yum.puppetlabs.com/${urlbit}/products/SRPMS",
    descr          => "Puppet Labs Products ${ostype} ${::os_maj_version} - Source",
    enabled        => '0',
    failovermethod => 'priority',
    gpgcheck       => '1',
    gpgkey         => 'file:///yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs',
  }
}
