define tomcat::deploy(
  $artname,
  $url,
  $version,
)
{
   $deploydir = "/opt/tomcat/webapps"
   
   exec {"remove_previous_$artname":
     command => "rm -rf $deploydir/$artname*",
     unless  => "grep -i $version /opt/$artname.version",
     path => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
  } ->
  file {"/opt/$artname.version":
    ensure => file,
    content => $version,
  } ->
  exec {"Download_war_$artname":
   command => "wget -O $deploydir/$artname.war $url",
   creates => "$deploydir/$artname.war",
   path => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
  }

}
    
