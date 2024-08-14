exec { 'ssh_configuration':
  command => 'echo "
# task 2 in 0x0B-ssh
    IdentityFile ~/.ssh/school
    PasswordAuthentication no
Host ubuntu
    HostName 34.203.38.10
    User ubuntu
    Port 22" >> /etc/ssh/ssh_config',
  path    => '/bin:/usr/bin',
  unless  => 'grep -q "Host ubuntu" /etc/ssh/ssh_config',
}
