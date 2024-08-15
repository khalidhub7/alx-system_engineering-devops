# Install Nginx
package { 'nginx':
  ensure => installed,
}

# Create index file
file { '/var/www/html/index.html':
  ensure  => file,
  content => 'Hello World!',
}

# Configure redirection
file_line { 'add_redirect_me':
  path  => '/etc/nginx/sites-available/default',
  after => 'server_name _;',
  line  => '        location /redirect_me {\n            return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;\n        }',
}

# Restart Nginx to apply changes
service { 'nginx':
  ensure    => running,
  enable    => true,
  subscribe => File['/etc/nginx/sites-available/default'],
}

