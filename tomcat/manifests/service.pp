class tomcat::service {

   file {'/etc/systemd/system/tomcat.service':
#    path => '/etc/systemd/system/tomcat.service',
    source => 'puppet:///modules/tomcat/tomcat.service',
    ensure => present,
    mode => '755',
    owner => 'tomcat',
    group => 'tomcat',
   # require => File['/opt/tomcat/bin/setenv.sh'],
    }
  service {'tomcat':
    ensure => 'running',
    enable => 'true',
    require => File['/etc/systemd/system/tomcat.service'],
    }
}
