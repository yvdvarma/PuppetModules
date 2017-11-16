class tomcat (
  $version = "8.5.23"
)
{

  group {'tomcat':
    ensure => present,
    }
  user {'tomcat':
    ensure => present,
    home  => '/sbin',
    shell => '/sbin/nologin',
    groups => 'tomcat',
    require => Group['tomcat'],
   } 
  exec {'download-tomcat':
    path => '/tmp',
    command => "/bin/wget -O /tmp/apache-tomcat-$version.tar.gz  http://www-us.apache.org/dist/tomcat/tomcat-8/v$version/bin/apache-tomcat-$version.tar.gz",
    creates => "/tmp/apache-tomcat-$version.tar.gz",
    require => User['tomcat'],
    }
  exec {'tomcat-extract':
    command => "tar -xzf /tmp/apache-tomcat-$version.tar.gz -C /opt/ && chown -R tomcat:tomcat /opt/apache-tomcat-$version",
    creates => "/opt/apache-tomcat-$version",
    path => ['/bin', '/sbin', '/usr/bin'],
    require => Exec['download-tomcat'],
    }
    file {'/opt/tomcat':
     ensure => link,
     target => "/opt/apache-tomcat-$version",
     owner =>  'tomcat',
     group => 'tomcat',
     require => Exec['tomcat-extract'],
     notify  => Service['tomcat'],
  }
  file {"/opt/tomcat/bin/setenv.sh":
    ensure => file,
    source => 'puppet:///modules/tomcat/setenv.sh',
    mode   => '0755',
    owner  => 'tomcat',
    group  => 'tomcat',
    require => File['/opt/tomcat'],
  }

  file {'/etc/systemd/system/tomcat.service':
#    path => '/etc/systemd/system/tomcat.service',
    source => 'puppet:///modules/tomcat/tomcat.service',
    ensure => present,
    mode => '755',
    owner => 'tomcat',
    group => 'tomcat',
    require => File['/opt/tomcat/bin/setenv.sh'],
    }
  service {'tomcat':
    ensure => 'running',
    enable => 'true',
    require => File['/etc/systemd/system/tomcat.service'],
    }
}
