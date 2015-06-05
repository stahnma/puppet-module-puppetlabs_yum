# Private class
class puppetlabs_yum::params (
  $urlbase = 'http://yum.puppetlabs.com',
) {

  if $::operatingsystemmajrelease {
    $os_maj_release = $::operatingsystemmajrelease
  } else {
    $os_versions    = split($::operatingsystemrelease, '[.]')
    $os_maj_release = $os_versions[0]
  }

  # There are some URL manipulations that have to happen based on exact OS type
  if $::osfamily == 'RedHat' {
    if $::operatingsystem == 'Fedora' {
      $ostype = 'Fedora'
      $urlbit = "fedora/f${os_maj_release}"
    } else {
      $ostype = 'EL'
      $urlbit = "el/${os_maj_release}"
    }
  }

  $products_baseurl         = "${urlbase}/${urlbit}/products/\$basearch"
  $deps_baseurl             = "${urlbase}/${urlbit}/dependencies/\$basearch"
  $devel_baseurl            = "${urlbase}/${urlbit}/devel/\$basearch"
  $products_source_baseurl  = "${urlbase}/${urlbit}/products/SRPMS"
  $deps_source_baseurl      = "${urlbase}/${urlbit}/dependencies/SRPMS"
  $devel_source_baseurl     = "${urlbase}/${urlbit}/devel/SRPMS"
  $products_descr           = "Puppet Labs Products ${ostype} ${os_maj_release} - \$basearch"
  $deps_descr               = "Puppet Labs Dependencies ${ostype} ${os_maj_release} - \$basearch"
  $devel_descr              = "Puppet Labs Devel ${ostype} ${os_maj_release} - \$basearch"
  $products_source_descr    = "Puppet Labs Products ${ostype} ${os_maj_release} - \$basearch - Source"
  $deps_source_descr        = "Puppet Labs Dependencies ${ostype} ${os_maj_release} - \$basearch - Source"
  $devel_source_descr       = "Puppet Labs Devel ${ostype} ${os_maj_release} - \$basearch - Source"

}
