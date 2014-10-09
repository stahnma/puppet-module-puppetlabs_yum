shared_context :puppetlabs_yum_devel do
  it do
    should contain_yumrepo('puppetlabs-devel').with({
      :enabled   => '0',
      :gpgcheck  => '1',
      :gpgkey    => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs',
    })
  end

  it do
    should contain_yumrepo('puppetlabs-devel-source').with({
      :enabled    => '0',
      :gpgcheck   => '1',
      :gpgkey     => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs',
    })
  end

  context 'when enable_devel => true' do
    let(:params) {{ :enable_devel => true }}

    it { should contain_yumrepo('puppetlabs-devel').with_enabled('1') }
  end
end

shared_examples_for 'puppetlabs_yum::devel-el6' do
  include_context :puppetlabs_yum_devel

  it do
    should contain_yumrepo('puppetlabs-devel').with({
      :baseurl   => 'http://yum.puppetlabs.com/el/6/devel/$basearch',
      :descr     => 'Puppet Labs Devel EL 6 - $basearch',
    })
  end

  it do
    should contain_yumrepo('puppetlabs-devel-source').with({
      :baseurl   => 'http://yum.puppetlabs.com/el/6/devel/SRPMS',
      :descr     => 'Puppet Labs Devel EL 6 - $basearch - Source',
    })
  end
end

shared_examples_for 'puppetlabs_yum::devel-f20' do
  include_context :puppetlabs_yum_devel

  it do
    should contain_yumrepo('puppetlabs-devel').with({
      :baseurl   => 'http://yum.puppetlabs.com/fedora/f20/devel/$basearch',
      :descr     => 'Puppet Labs Devel Fedora 20 - $basearch',
    })
  end

  it do
    should contain_yumrepo('puppetlabs-devel-source').with({
      :baseurl   => 'http://yum.puppetlabs.com/fedora/f20/devel/SRPMS',
      :descr     => 'Puppet Labs Devel Fedora 20 - $basearch - Source',
    })
  end
end
