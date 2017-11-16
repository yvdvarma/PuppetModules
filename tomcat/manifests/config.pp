class tomcat::config {

 file {"/opt/tomcat/bin/setenv.sh":
    ensure => file,
    source => 'puppet:///modules/tomcat/setenv.sh',
    mode   => '0755',
    owner  => 'tomcat',
    group  => 'tomcat',
#    require => File['/opt/tomcat'],
  }
}
