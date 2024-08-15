# Install Nginx
exec { 'setup_nginx':
  command => 'apt -y update && apt -y upgrade && apt -y install nginx && echo "Hello World!" | tee /var/www/html/index.html',
  path    => ['/usr/bin', '/usr/sbin'],
}

# Backup, Redirection, custom 404 page
exec { 'configure_nginx':
  command => 'cp /etc/nginx/sites-available/default ~/backups/available_default && sed -i \'53i\\n\n\n# this is for task 3 in 0x0C-web_server\\n\\tlocation /redirect_me {\\n\\t\\treturn 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;\\n\\t}\\n\\n\' /etc/nginx/sites-available/default && echo "Ceci n\'est pas une page" | tee /var/www/html/error_404.html && sed -i \'62i\\\terror_page 404 /error_404.html;\\n\\\' /etc/nginx/sites-available/default',
  path    => ['/usr/bin', '/usr/sbin'],
  notify  => Exec['restart_nginx'],
  require => Exec['setup_nginx'],
}

# restart
exec { 'restart_nginx':
  command => 'service nginx restart',
  path    => ['/usr/bin', '/usr/sbin'],
  refreshonly => true,
}
