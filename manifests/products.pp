# Private class
class puppetlabs_yum::products {

  if $puppetlabs_yum::enable_products {
    $enabled = '1'
  } else {
    $enabled = '0'
  }

  yumrepo { 'puppetlabs-products':
    baseurl  => $puppetlabs_yum::products_baseurl,
    descr    => $puppetlabs_yum::products_descr,
    enabled  => $enabled,
    gpgcheck => '1',
    gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs',
  }

  yumrepo { 'puppetlabs-products-source':
    baseurl        => $puppetlabs_yum::products_source_baseurl,
    descr          => $puppetlabs_yum::products_source_descr,
    enabled        => '0',
    failovermethod => 'priority',
    gpgcheck       => '1',
    gpgkey         => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs',
  }
}
