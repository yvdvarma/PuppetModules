class test::config (
  $emp = "worker"
)
{ 

file {"/tmp/http":
    content => template("test/http.erb"),
  }

}
