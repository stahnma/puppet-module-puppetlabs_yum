# This fact determines if you are running Puppet Enterprise on an RPM based
# system.

Facter.add(:pper_installed) do
  confine :osfamily => 'RedHat'
  setcode do
    %x{rpm -q pe-puppet-enterprise-release &> /dev/null}
    if $? == 0
      true
    else
      false
    end
  end
end
