# Private class
class puppetlabs_yum::deps {

  if $puppetlabs_yum::enable_deps {
    $enabled = '1'
  } else {
    $enabled = '0'
  }

  yumrepo { 'puppetlabs-deps':
    baseurl  => $puppetlabs_yum::deps_baseurl,
    descr    => $puppetlabs_yum::deps_descr,
    enabled  => $enabled,
    gpgcheck => '1',
    gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs',
  }
  yumrepo { 'puppetlabs-deps-source':
    baseurl  => $puppetlabs_yum::deps_source_baseurl,
    descr    => $puppetlabs_yum::deps_source_descr,
    enabled  => '0',
    gpgcheck => '1',
    gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs',
  }
}
