class apache (
  $port  = $apache::params::port,
 ) inherits apache::params 
{
  class { 'apache::install': } 
-> class { 'apache::config': 
     port => $port,
  } 
~> class { 'apache::service': }
}
