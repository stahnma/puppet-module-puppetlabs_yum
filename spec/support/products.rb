shared_context :puppetlabs_yum_products do
  it do
    should contain_yumrepo('puppetlabs-products').with({
      :enabled   => '1',
      :gpgcheck  => '1',
      :gpgkey    => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs',
    })
  end

  it do
    should contain_yumrepo('puppetlabs-products-source').with({
      :enabled          => '0',
      :failovermethod   => 'priority',
      :gpgcheck         => '1',
      :gpgkey           => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs',
    })
  end
end

shared_examples_for 'puppetlabs_yum::products-el6' do
  include_context :puppetlabs_yum_products

  it do
    should contain_yumrepo('puppetlabs-products').with({
      :baseurl   => 'http://yum.puppetlabs.com/el/6/products/$basearch',
      :descr     => 'Puppet Labs Products EL 6 - $basearch',
    })
  end

  it do
    should contain_yumrepo('puppetlabs-products-source').with({
      :baseurl   => 'http://yum.puppetlabs.com/el/6/products/SRPMS',
      :descr     => 'Puppet Labs Products EL 6 - $basearch - Source',
    })
  end
end

shared_examples_for 'puppetlabs_yum::products-f20' do
  include_context :puppetlabs_yum_products

  it do
    should contain_yumrepo('puppetlabs-products').with({
      :baseurl   => 'http://yum.puppetlabs.com/fedora/f20/products/$basearch',
      :descr     => 'Puppet Labs Products Fedora 20 - $basearch',
    })
  end

  it do
    should contain_yumrepo('puppetlabs-products-source').with({
      :baseurl   => 'http://yum.puppetlabs.com/fedora/f20/products/SRPMS',
      :descr     => 'Puppet Labs Products Fedora 20 - $basearch - Source',
    })
  end
end
