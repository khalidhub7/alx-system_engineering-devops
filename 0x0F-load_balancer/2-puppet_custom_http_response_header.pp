# same as task 0 configuration of custom header but using puppet

exec { 'install_nginx_and_configure_header':
  command  => 'apt-get -y update &&
              apt-get -y install nginx &&
              sudo sed -i "/listen 80 default_server;/a add_header X-Served-By \$hostname;" /etc/nginx/sites-enabled/default &&
              service nginx restart',
  provider => shell,
}
