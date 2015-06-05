# Private class
class puppetlabs_yum::devel {

  if $puppetlabs_yum::enable_devel {
    $enabled = '1'
  } else {
    $enabled = '0'
  }

  yumrepo { 'puppetlabs-devel':
    baseurl  => $puppetlabs_yum::devel_baseurl,
    descr    => $puppetlabs_yum::devel_descr,
    enabled  => $enabled,
    gpgcheck => '1',
    gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs',
  }

  yumrepo { 'puppetlabs-devel-source':
    baseurl  => $puppetlabs_yum::devel_source_baseurl,
    descr    => $puppetlabs_yum::devel_source_descr,
    enabled  => '0',
    gpgcheck => '1',
    gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs',
  }

}
