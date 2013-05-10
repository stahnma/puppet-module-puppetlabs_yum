require 'spec_helper'

describe 'puppetlabs_yum::devel' do
  shared_context :puppetlabs_yum_devel do
    it { should include_class('puppetlabs_yum::params') }

    it do
      should contain_yumrepo('puppetlabs-devel').with({
        'enabled'  => '0',
        'gpgcheck' => '1',
        'gpgkey'   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs',
      })
    end

    it do
      should contain_yumrepo('puppetlabs-devel-source').with({
        'enabled'  => '0',
        'gpgcheck' => '1',
        'gpgkey'   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs',
      })
    end
  end

  context 'os_maj_version => 5' do
    include_context :puppetlabs_yum_devel

    let :facts do
      {
        :osfamily         => 'RedHat',
        :operatingsystem  => 'CentOS',
        :os_maj_version   => '5',
        :architecture     => 'x86_64',
      }
    end

    it do
      should contain_yumrepo('puppetlabs-devel').with({
        'baseurl'  => 'http://yum.puppetlabs.com/el/5/devel/x86_64',
        'descr'    => 'Puppet Labs Devel EL 5 - x86_64',
      })
    end

    it do
      should contain_yumrepo('puppetlabs-devel-source').with({
        'baseurl'  => 'http://yum.puppetlabs.com/el/5/devel/SRPMS',
        'descr'    => 'Puppet Labs Devel EL 5 - x86_64 - Source',
      })
    end
  end

  context 'operatingsystem => CentOS' do
    context 'os_maj_version => 6' do
      include_context :puppetlabs_yum_devel

      let :facts do
        {
          :osfamily         => 'RedHat',
          :operatingsystem  => 'CentOS',
          :os_maj_version   => '6',
          :architecture     => 'x86_64',
        }
      end

      it do
        should contain_yumrepo('puppetlabs-devel').with({
          'baseurl'  => 'http://yum.puppetlabs.com/el/6/devel/x86_64',
          'descr'    => 'Puppet Labs Devel EL 6 - x86_64',
        })
      end

      it do
        should contain_yumrepo('puppetlabs-devel-source').with({
          'baseurl'  => 'http://yum.puppetlabs.com/el/6/devel/SRPMS',
          'descr'    => 'Puppet Labs Devel EL 6 - x86_64 - Source',
        })
      end
    end
  end

  context 'operatingsystem => Fedora' do
    context 'os_maj_version => 17' do
      include_context :puppetlabs_yum_devel

      let :facts do
        {
          :osfamily         => 'RedHat',
          :operatingsystem  => 'Fedora',
          :os_maj_version   => '17',
          :architecture     => 'x86_64',
        }
      end

      it do
        should contain_yumrepo('puppetlabs-devel').with({
          'baseurl'  => 'http://yum.puppetlabs.com/fedora/f17/devel/x86_64',
          'descr'    => 'Puppet Labs Devel Fedora 17 - x86_64',
        })
      end

      it do
        should contain_yumrepo('puppetlabs-devel-source').with({
          'baseurl'  => 'http://yum.puppetlabs.com/fedora/f17/devel/SRPMS',
          'descr'    => 'Puppet Labs Devel Fedora 17 - x86_64 - Source',
        })
      end
    end

    context 'os_maj_version => 18' do
      include_context :puppetlabs_yum_devel

      let :facts do
        {
          :osfamily         => 'RedHat',
          :operatingsystem  => 'Fedora',
          :os_maj_version   => '18',
          :architecture     => 'x86_64',
        }
      end

      it do
        should contain_yumrepo('puppetlabs-devel').with({
          'baseurl'  => 'http://yum.puppetlabs.com/fedora/f18/devel/x86_64',
          'descr'    => 'Puppet Labs Devel Fedora 18 - x86_64',
        })
      end

      it do
        should contain_yumrepo('puppetlabs-devel-source').with({
          'baseurl'  => 'http://yum.puppetlabs.com/fedora/f18/devel/SRPMS',
          'descr'    => 'Puppet Labs Devel Fedora 18 - x86_64 - Source',
        })
      end
    end

    context 'os_maj_version => 19' do
      include_context :puppetlabs_yum_devel

      let :facts do
        {
          :osfamily         => 'RedHat',
          :operatingsystem  => 'Fedora',
          :os_maj_version   => '19',
          :architecture     => 'x86_64',
        }
      end

      it do
        should contain_yumrepo('puppetlabs-devel').with({
          'baseurl'  => 'http://yum.puppetlabs.com/fedora/f19/devel/x86_64',
          'descr'    => 'Puppet Labs Devel Fedora 19 - x86_64',
        })
      end

      it do
        should contain_yumrepo('puppetlabs-devel-source').with({
          'baseurl'  => 'http://yum.puppetlabs.com/fedora/f19/devel/SRPMS',
          'descr'    => 'Puppet Labs Devel Fedora 19 - x86_64 - Source',
        })
      end
    end
  end
end