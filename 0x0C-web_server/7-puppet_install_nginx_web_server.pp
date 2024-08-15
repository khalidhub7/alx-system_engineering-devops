# Update and upgrade the system, install Nginx, and create index.html
exec { 'update_and_upgrade':
  command => 'apt -y update && apt -y upgrade',
  path    => ['/usr/bin', '/usr/sbin'],
  unless  => 'test -f /var/www/html/index.html',
}

exec { 'install_nginx':
  command => 'apt -y install nginx',
  path    => ['/usr/bin', '/usr/sbin'],
  require => Exec['update_and_upgrade'],
}

exec { 'create_index_html':
  command => 'echo "Hello World!" | tee /var/www/html/index.html',
  path    => ['/usr/bin', '/usr/sbin'],
  require => Exec['install_nginx'],
}

# Backup the Nginx configuration file
exec { 'backup_nginx_config':
  command => 'cp /etc/nginx/sites-available/default ~/backups/available_default',
  path    => ['/usr/bin', '/usr/sbin'],
  unless  => 'test -f ~/backups/available_default',
  require => Exec['install_nginx'],
}

# Modify Nginx configuration to add redirection
exec { 'add_redirection':
  command => "sed -i '53i\\n\n\n# this is for task 3 in 0x0C-web_server\\n\\tlocation /redirect_me {\\n\\t\\treturn 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;\\n\\t}\\n\\n' /etc/nginx/sites-available/default",
  path    => ['/usr/bin', '/usr/sbin'],
  require => Exec['backup_nginx_config'],
  notify  => Exec['restart_nginx'],
}

# Create custom 404 page
exec { 'create_404_page':
  command => "echo \"Ceci n'est pas une page\" | tee /var/www/html/error_404.html",
  path    => ['/usr/bin', '/usr/sbin'],
  require => Exec['create_index_html'],
}

# Modify Nginx configuration to add custom 404 page handling
exec { 'add_custom_404_page':
  command => "sed -i '62i\\\terror_page 404 /error_404.html;\\n\\' /etc/nginx/sites-available/default",
  path    => ['/usr/bin', '/usr/sbin'],
  require => Exec['create_404_page'],
  notify  => Exec['restart_nginx'],
}

# Restart Nginx service
exec { 'restart_nginx':
  command => 'service nginx restart',
  path    => ['/usr/bin', '/usr/sbin'],
  refreshonly => true,
  require => [
    Exec['add_redirection'],
    Exec['add_custom_404_page'],
  ],
}

