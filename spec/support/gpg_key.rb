shared_examples_for 'puppetlabs_yum::gpg_key' do
  it do
    should contain_gpg_key('RPM-GPG-KEY-puppetlabs').with({
      :path => '/etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs'
    })
  end

  it do
    should contain_file('/etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs').with({
      :ensure => 'present',
      :owner  => 'root',
      :group  => 'root',
      :mode   => '0644',
      :source => 'puppet:///modules/puppetlabs_yum/RPM-GPG-KEY-puppetlabs',
    })
  end
end
