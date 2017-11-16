stage {'pre-10':}
stage {'post-10':}
node 'puppetagent' {
  #class {'apache':
  #  port => 8080,
  #}
  include java
  #class {'java':} ->
  class {'tomcat':
   version => '8.0.47'
  }
  #class {'ntp':
  # enable => false,
  #}
  #include test 
  #class {'test':
  # emp => "worker"
  #}
   
  
 
}

node 'puppetserver' {
  include test
 
}

Stage['pre-10'] -> Stage['main'] -> Stage['post-10']
