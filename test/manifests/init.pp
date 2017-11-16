class test (

$emp = "worker",
$fruits = [ "Apple", "Orange", "Banana", "Avocado" ],
$artifacts = {
	app1 => { 'appname' => 'gmail',
		  'url' => 'www.gmail.com',
		  'version' => 'Mailing application'
		 },
	app2 => { 'appname' => 'redbus',
		   'url' => 'www.redbus.com',
		   'version' => 'ticketing application'
		 },
	app3 => { 'appname' => 'naukri',
		  'url'  => 'www.naukri.com',
		  'version' => 'job site'
		}
              },
$data = {
    'vikram' => {
        comment => 'test account for vikram',
    },
    'afroz' => {
        comment => 'test account for afroz',
    }
}

)

{
#  $app1name = $artifacts['app1']['url']
#  notify { "the name of $app1name": }
  create_resources ( test::deploy, $artifacts )
  create_resources (user, $data)

class {'test::config':
   emp => $emp
 }
  
file {'/tmp/test_array':
  content => template('test/array.erb')
  }
  
 
}


