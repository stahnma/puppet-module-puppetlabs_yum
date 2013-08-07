# Configure repositories for yum.puppetlabs.com

# About
This module basically just mimics the puppetlabs-release rpm. The same repos are
enabled/disabled and the GPG key is imported.  In the end you will end up with
the yum.puppetlabs.com repos configured.

The following Repos will be setup and enabled by default:

  * puppetlabs-products
  * puppetlabs-deps

Other repositories that will setup but disabled (as per the puppetlabs-release setup)

   * puppetlabs-devel (pre-release software)
   * puppetlabs-source (source packages)

## New in 0.1.2

This module now noops if you have PE installed as not to put the system in a state of confusion.

This commit creates a custom fact to determine if pe-puppet-enterprise-release
is installed. If it is, we just noop the module. This allows for all systems to
have this modules setup and classified while still retraining relatively sane
and expected behavior.

## New in 0.1.0

Devel can now be enabled through a class parameter through.
  enable_devel = true

# Proxy
If you have an http proxy required to access the internet, you can use the
$proxy variable in the params.pp file. If it is set to a value other than
'absent' a proxy will be setup with each repository.  Note that otherwise each
of the repos will fall back to settings in the /etc/yum.conf file.

# Why?
I was one of the people who set up yum.puppetlabs. My team owns the Puppet Labs
release rpm so this puppet module should stay fairly in line with whatever
happens to the upstream package.

This module would allow to use something like a stock puppet in to configure
the repository to upgrade to a newer one.

Note there is a puppetlabs-release package that basically does the same thing
this module does.  It is found in the products folders under your respective
family and version of operating system.

# Futher Information

  * [yum.puppetlabs.com](http://yum.puppetlabs.com)

# Testing

  * This was tested using Puppet 2.7.x on Centos5/6
  * I assume it will work on any RHEL or Fedora variant
  * Also, I think this should work with earlier versions of Puppet (2.6.x at least)

## Unit tests

    $ bundle install
    $ bundle exec rake spec:all

# License
Apache Software License 2.0
