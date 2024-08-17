# add custom header using puppet

exec { ' Add a custom HTTP header with Puppet':
  command  => 'sudo apt -y update && apt-get -y install nginx &&
              sudo sed -i '21i add_header X-Served-By \$hostname; #Add custom header 0x0F-load_balancer TASK 0' /etc/nginx/sites-enabled/default &&
              service nginx restart',
  provider => shell,
}
