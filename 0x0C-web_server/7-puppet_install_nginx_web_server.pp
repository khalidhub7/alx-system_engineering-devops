# install nginx
package { 'nginx':
  ensure => installed,
}

# website index file
file { '/var/www/html/index.html':
  content => 'Hello World!',
}

# run nginx
exec { 'start service':
  command => 'sudo service nginx start',
  path    => ['/bin', '/usr/bin', '/usr/sbin'],
}
