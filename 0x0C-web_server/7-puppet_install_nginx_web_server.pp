# Install and configure Nginx
exec { 'update_system':
  command => 'apt -y update',
  path    => ['/usr/bin', '/usr/sbin'],
}

exec { 'upgrade_system':
  command => 'apt -y upgrade',
  path    => ['/usr/bin', '/usr/sbin'],
  require => Exec['update_system'],
}

exec { 'install_nginx':
  command => 'apt -y install nginx',
  path    => ['/usr/bin', '/usr/sbin'],
  require => Exec['upgrade_system'],
}

exec { 'create_index_html':
  command => 'echo "Hello World!" | tee /var/www/html/index.html',
  path    => ['/usr/bin', '/usr/sbin'],
  require => Exec['install_nginx'],
}

exec { 'backup_nginx_config':
  command => 'cp /etc/nginx/sites-available/default ~/backups/available_default',
  path    => ['/usr/bin', '/usr/sbin'],
  unless  => 'test -f ~/backups/available_default',
  require => Exec['install_nginx'],
}

exec { 'add_redirection':
  command => "sed -i '53i\\n\n\n# this is for task 3 in 0x0C-web_server\\n\\tlocation /redirect_me {\\n\\t\\treturn 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;\\n\\t}\\n\\n' /etc/nginx/sites-available/default",
  path    => ['/usr/bin', '/usr/sbin'],
  require => Exec['backup_nginx_config'],
}

exec { 'create_custom_404_page':
  command => "echo \"Ceci n'est pas une page\" | tee /var/www/html/error_404.html",
  path    => ['/usr/bin', '/usr/sbin'],
  require => Exec['create_index_html'],
}

exec { 'add_custom_404_page':
  command => "sed -i '62i\\\terror_page 404 /error_404.html;\\n\\' /etc/nginx/sites-available/default",
  path    => ['/usr/bin', '/usr/sbin'],
  require => Exec['create_custom_404_page'],
}

exec { 'restart_nginx':
  command => 'service nginx restart',
  path    => ['/usr/bin', '/usr/sbin'],
  require => Exec['add_custom_404_page'],
}
