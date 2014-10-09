require 'spec_helper'

describe 'puppetlabs_yum' do
  shared_examples_for :puppetlabs_yum_supported do
    it { should create_class('puppetlabs_yum') }
    it { should contain_anchor('puppetlabs_yum::start').that_comes_before('Class[puppetlabs_yum::gpg_key]') }
    it { should contain_class('puppetlabs_yum::gpg_key').that_comes_before('Class[puppetlabs_yum::products]') }
    it { should contain_class('puppetlabs_yum::products').that_comes_before('Class[puppetlabs_yum::deps]') }
    it { should contain_class('puppetlabs_yum::deps').that_comes_before('Class[puppetlabs_yum::devel]') }
    it { should contain_class('puppetlabs_yum::devel').that_comes_before('Anchor[puppetlabs_yum::end]') }
    it { should contain_anchor('puppetlabs_yum::end') }
  end

  shared_examples_for :puppetlabs_yum_unsupported do
    it { should create_class('puppetlabs_yum') }
    it { should_not contain_anchor('puppetlabs_yum::start') }
    it { should_not contain_class('puppetlabs_yum::gpg_key') }
    it { should_not contain_class('puppetlabs_yum::products') }
    it { should_not contain_class('puppetlabs_yum::deps') }
    it { should_not contain_class('puppetlabs_yum::devel') }
    it { should_not contain_anchor('puppetlabs_yum::end') }
  end

  context 'operatingsystem => CentOS' do
    let :facts do
      {
        :osfamily                   => 'RedHat',
        :operatingsystem            => 'CentOS',
        :operatingsystemmajrelease  => '6',
      }
    end

    it_behaves_like :puppetlabs_yum_supported
    it_behaves_like 'puppetlabs_yum::gpg_key'
    it_behaves_like 'puppetlabs_yum::products-el6'
    it_behaves_like 'puppetlabs_yum::deps-el6'
    it_behaves_like 'puppetlabs_yum::devel-el6'

    context 'when operatingsystemmajrelease is undef' do
      let :facts do
        {
          :osfamily               => 'RedHat',
          :operatingsystem        => 'CentOS',
          :operatingsystemrelease => '6.5',
        }
      end

      it_behaves_like :puppetlabs_yum_supported
      it_behaves_like 'puppetlabs_yum::gpg_key'
      it_behaves_like 'puppetlabs_yum::products-el6'
      it_behaves_like 'puppetlabs_yum::deps-el6'
      it_behaves_like 'puppetlabs_yum::devel-el6'
    end
  end

  context 'operatingsystem => Fedora' do
    let :facts do
      {
        :osfamily                   => 'RedHat',
        :operatingsystem            => 'Fedora',
        :operatingsystemmajrelease  => '20',
      }
    end

    it_behaves_like :puppetlabs_yum_supported
    it_behaves_like 'puppetlabs_yum::gpg_key'
    it_behaves_like 'puppetlabs_yum::products-f20'
    it_behaves_like 'puppetlabs_yum::deps-f20'
    it_behaves_like 'puppetlabs_yum::devel-f20'
  end

  context 'is_pe => true' do
    let :facts do
      {
        :osfamily                   => 'RedHat',
        :operatingsystem            => 'CentOS',
        :operatingsystemmajrelease  => '6',
        :is_pe                      => 'true'
      }
    end

    it_behaves_like :puppetlabs_yum_unsupported
  end

  context 'osfamily => Debian' do
    let :facts do
      {
        :osfamily => 'Debian',
      }
    end

    it_behaves_like :puppetlabs_yum_unsupported
  end
end