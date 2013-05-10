require 'spec_helper'

describe 'puppetlabs_yum' do
  shared_context :puppetlabs_yum_std do
    it { should include_class('puppetlabs_yum::products') }
    it { should include_class('puppetlabs_yum::deps') }
    it { should contain_class('puppetlabs_yum::devel').with({'enable_devel' => 'false'}) }

    it do
      should contain_puppetlabs_yum__rpm_gpg_key('RPM-GPG-KEY-puppetlabs').with({
        'path'  => '/etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs',
      })
    end

    it do
      should contain_file('/etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs').with({
        'ensure' => 'present',
        'owner'  => '0',
        'group'  => '0',
        'mode'   => '0644',
        'source' => 'puppet:///modules/puppetlabs_yum/RPM-GPG-KEY-puppetlabs',
      })
    end
  end

  context 'operatingsystem => CentOS' do
    include_context :puppetlabs_yum_std

    let :facts do
      {
        :osfamily         => 'RedHat',
        :operatingsystem  => 'CentOS',
      }
    end
  end

  context 'operatingsystem => Fedora' do
    include_context :puppetlabs_yum_std

    let :facts do
      {
        :osfamily         => 'RedHat',
        :operatingsystem  => 'Fedora',
      }
    end
  end
end