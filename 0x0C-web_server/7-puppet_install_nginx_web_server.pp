# Setup New Ubuntu server with nginx

# Update system package lists
exec { 'update system':
    command => '/usr/bin/apt-get update',
}

# Install nginx package
package { 'nginx':
    ensure => 'installed',
    require => Exec['update system'],
}

# Create index.html with "Hello World!" content
file { '/var/www/html/index.html':
    content => 'Hello World!',
}

# Add a rewrite rule to nginx configuration
exec { 'redirect_me':
    command => '/bin/sed -i "26i\\       rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;" /etc/nginx/sites-available/default',
    provider => 'shell',
    require => Package['nginx'],
}

# Ensure nginx service is running
service { 'nginx':
    ensure => 'running',
    require => Package['nginx'],
}
