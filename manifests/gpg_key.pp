# Private class
class puppetlabs_yum::gpg_key {

  gpg_key { 'RPM-GPG-KEY-puppetlabs':
    path => '/etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs',
  }

  file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/puppetlabs_yum/RPM-GPG-KEY-puppetlabs',
  }

}
