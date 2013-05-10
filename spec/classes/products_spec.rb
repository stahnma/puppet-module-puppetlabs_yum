require 'spec_helper'

describe 'puppetlabs_yum::products' do
  shared_context :puppetlabs_yum_products do
    it { should include_class('puppetlabs_yum::params') }

    it do
      should contain_yumrepo('puppetlabs-products').with({
        'enabled'  => '1',
        'gpgcheck' => '1',
        'gpgkey'   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs',
      })
    end

    it do
      should contain_yumrepo('puppetlabs-products-source').with({
        'enabled'         => '0',
        'failovermethod'  => 'priority',
        'gpgcheck'        => '1',
        'gpgkey'          => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs',
      })
    end
  end

  context 'os_maj_version => 5' do
    include_context :puppetlabs_yum_products

    let :facts do
      {
        :osfamily         => 'RedHat',
        :operatingsystem  => 'CentOS',
        :os_maj_version   => '5',
        :architecture     => 'x86_64',
      }
    end

    it do
      should contain_yumrepo('puppetlabs-products').with({
        'baseurl'  => 'http://yum.puppetlabs.com/el/5/products/x86_64',
        'descr'    => 'Puppet Labs Products EL 5 - x86_64',
      })
    end

    it do
      should contain_yumrepo('puppetlabs-products-source').with({
        'baseurl'  => 'http://yum.puppetlabs.com/el/5/products/SRPMS',
        'descr'    => 'Puppet Labs Products EL 5 - x86_64 - Source',
      })
    end
  end

  context 'operatingsystem => CentOS' do
    context 'os_maj_version => 6' do
      include_context :puppetlabs_yum_products

      let :facts do
        {
          :osfamily         => 'RedHat',
          :operatingsystem  => 'CentOS',
          :os_maj_version   => '6',
          :architecture     => 'x86_64',
        }
      end

      it do
        should contain_yumrepo('puppetlabs-products').with({
          'baseurl'  => 'http://yum.puppetlabs.com/el/6/products/x86_64',
          'descr'    => 'Puppet Labs Products EL 6 - x86_64',
        })
      end

      it do
        should contain_yumrepo('puppetlabs-products-source').with({
          'baseurl'  => 'http://yum.puppetlabs.com/el/6/products/SRPMS',
          'descr'    => 'Puppet Labs Products EL 6 - x86_64 - Source',
        })
      end
    end
  end

  context 'operatingsystem => Fedora' do
    context 'os_maj_version => 17' do
      include_context :puppetlabs_yum_products

      let :facts do
        {
          :osfamily         => 'RedHat',
          :operatingsystem  => 'Fedora',
          :os_maj_version   => '17',
          :architecture     => 'x86_64',
        }
      end

      it do
        should contain_yumrepo('puppetlabs-products').with({
          'baseurl'  => 'http://yum.puppetlabs.com/fedora/f17/products/x86_64',
          'descr'    => 'Puppet Labs Products Fedora 17 - x86_64',
        })
      end

      it do
        should contain_yumrepo('puppetlabs-products-source').with({
          'baseurl'  => 'http://yum.puppetlabs.com/fedora/f17/products/SRPMS',
          'descr'    => 'Puppet Labs Products Fedora 17 - x86_64 - Source',
        })
      end
    end

    context 'os_maj_version => 18' do
      include_context :puppetlabs_yum_products

      let :facts do
        {
          :osfamily         => 'RedHat',
          :operatingsystem  => 'Fedora',
          :os_maj_version   => '18',
          :architecture     => 'x86_64',
        }
      end

      it do
        should contain_yumrepo('puppetlabs-products').with({
          'baseurl'  => 'http://yum.puppetlabs.com/fedora/f18/products/x86_64',
          'descr'    => 'Puppet Labs Products Fedora 18 - x86_64',
        })
      end

      it do
        should contain_yumrepo('puppetlabs-products-source').with({
          'baseurl'  => 'http://yum.puppetlabs.com/fedora/f18/products/SRPMS',
          'descr'    => 'Puppet Labs Products Fedora 18 - x86_64 - Source',
        })
      end
    end

    context 'os_maj_version => 19' do
      include_context :puppetlabs_yum_products

      let :facts do
        {
          :osfamily         => 'RedHat',
          :operatingsystem  => 'Fedora',
          :os_maj_version   => '19',
          :architecture     => 'x86_64',
        }
      end

      it do
        should contain_yumrepo('puppetlabs-products').with({
          'baseurl'  => 'http://yum.puppetlabs.com/fedora/f19/products/x86_64',
          'descr'    => 'Puppet Labs Products Fedora 19 - x86_64',
        })
      end

      it do
        should contain_yumrepo('puppetlabs-products-source').with({
          'baseurl'  => 'http://yum.puppetlabs.com/fedora/f19/products/SRPMS',
          'descr'    => 'Puppet Labs Products Fedora 19 - x86_64 - Source',
        })
      end
    end
  end
end