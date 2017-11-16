class ntp (
  $enable = true

 )

 {
  #if $::osfamily == 'RedHat'
  # {
  #  $package_name = 'ntp'
  # }
  #elsif $::osfamily == 'Debian'
  # {
  #  $package_name = 'ntpd'
  # }

  #else
  # {
  #  fail('Unsupported OS Family')
  # }

  case $facts['os']['family']
  {
     'RedHat': {
	$package_name = 'ntp'
      }
     'Debian': {
	$package_name = 'ntpd'
      }
      default : {
	fail('Unsupported OS Family')
      }
  }

  package { "$package_name":
    ensure => 'installed',
   }
 
 if $enable

  { 
   service {"ntpd":
    ensure => 'running',
    require => Package[$package_name],
    }
  }
}
 
