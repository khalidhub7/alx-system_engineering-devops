
# install nginx
package { 'nginx':
  ensure => installed,
}

# website index file
file { '/var/www/html/index.html':
  content => 'Hello World!',
}

# redirect_me config
file_line { 'redirect_me':
  ensure => present,
  path   => '/etc/nginx/sites-available/default',
  after  => 'server_name _;',
  line   => '# this is for task 3 in 0x0C-web_server\n\tlocation /redirect_me {\n\t\treturn 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;\n\t}',
}

# stop nginx
exec { 'stop service':
  command => 'sudo service nginx stop',
  path    => ['/bin', '/usr/bin', '/usr/sbin'],
}

# run nginx
exec { 'start service':
  command => 'sudo service nginx start',
  path    => ['/bin', '/usr/bin', '/usr/sbin'],
}
