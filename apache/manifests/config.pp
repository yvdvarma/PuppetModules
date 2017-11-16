class apache::config(
 $port,
)
{
  file {'/etc/httpd/conf/httpd.conf':
    ensure => present,
    content => template('apache/httpd.conf.erb'),
    }
}
