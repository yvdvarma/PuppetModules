class tomcat::params {

 $version = '8.0.23'
 $artifacts = {
    artifact1 => {'artname' => 'sample',
                  'url' => 'http://twss.weather.com.cn/docs/appdev/sample/sample.war',
                  'version' => '0.1'
                  },
    artifact2 => {'artname' => 'welcome',
                  'url' => 'http://192.168.0.28/welcome.war',
                  'version' => '0.1'
                  }
    }

}
