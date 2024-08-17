# add custom header using puppet

exec { 'add_custom_http_header':
  command => 'sudo apt -y update && sudo apt-get -y install nginx && \
              sudo sed -i \'21i add_header X-Served-By \$hostname; #Add custom header 0x0F-load_balancer TASK 0\' /etc/nginx/sites-enabled/default && \
              sudo service nginx restart',
  provider => shell,
}
