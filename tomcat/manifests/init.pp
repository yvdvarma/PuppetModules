class tomcat (
  $version = $tomcat::params::version,
  $artifacts = $tomcat::params::artifacts,
  
) inherits tomcat::params
{
   class { 'tomcat::install':
    version => $version,
    notify => Class['tomcat::service'],
   } ->
   class {'tomcat::config':}
   create_resources ('tomcat::deploy', $artifacts)
   class {'tomcat::service':}
 }

