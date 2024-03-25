#Using Puppet, create a manifest
exec { 'killmenow':
  command => 'pkill killmenow',
}
