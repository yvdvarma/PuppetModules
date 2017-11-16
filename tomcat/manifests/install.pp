class tomcat::install (
  $version,
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
  #   notify  => Service['tomcat'],
    }
}
