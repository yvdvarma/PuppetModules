class java (

 $version = "151"
 )

{

  exec {"download_java":
    command => "/bin/wget -O /tmp/jdk-8u$version.rpm --header 'Cookie: oraclelicense=accept-securebackup-cookie' http://download.oracle.com/otn-pub/java/jdk/8u$version-b12/e758a0de34e24606bca991d704f6dcbf/jdk-8u$version-linux-x64.rpm",
    creates => "/tmp/jdk-8u$version.rpm",    
    }


  package {"jdk1.8-1.8.0_$version":
    provider => 'rpm',
    ensure => installed,
    source => "/tmp/jdk-8u$version.rpm",
    require => Exec['download_java'],
   }
}
