shared_context :puppetlabs_yum_deps do
  it do
    should contain_yumrepo('puppetlabs-deps').with({
      :enabled   => '1',
      :gpgcheck  => '1',
      :gpgkey    => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs',
    })
  end

  it do
    should contain_yumrepo('puppetlabs-deps-source').with({
      :enabled    => '0',
      :gpgcheck   => '1',
      :gpgkey     => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs',
    })
  end
end

shared_examples_for 'puppetlabs_yum::deps-el6' do
  include_context :puppetlabs_yum_deps

  it do
    should contain_yumrepo('puppetlabs-deps').with({
      :baseurl   => 'http://yum.puppetlabs.com/el/6/dependencies/$basearch',
      :descr     => 'Puppet Labs Dependencies EL 6 - $basearch',
    })
  end

  it do
    should contain_yumrepo('puppetlabs-deps-source').with({
      :baseurl   => 'http://yum.puppetlabs.com/el/6/dependencies/SRPMS',
      :descr     => 'Puppet Labs Dependencies EL 6 - $basearch - Source',
    })
  end
end

shared_examples_for 'puppetlabs_yum::deps-f20' do
  include_context :puppetlabs_yum_deps

  it do
    should contain_yumrepo('puppetlabs-deps').with({
      :baseurl   => 'http://yum.puppetlabs.com/fedora/f20/dependencies/$basearch',
      :descr     => 'Puppet Labs Dependencies Fedora 20 - $basearch',
    })
  end

  it do
    should contain_yumrepo('puppetlabs-deps-source').with({
      :baseurl   => 'http://yum.puppetlabs.com/fedora/f20/dependencies/SRPMS',
      :descr     => 'Puppet Labs Dependencies Fedora 20 - $basearch - Source',
    })
  end
end
