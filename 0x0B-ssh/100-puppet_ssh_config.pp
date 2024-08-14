file { 'configure_ssh':
  path    => '/etc/ssh/ssh_config',
  ensure  => file,
  content => "# task 2 in 0x0B-ssh
IdentityFile ~/.ssh/school
PasswordAuthentication no
Host ubuntu
    HostName 34.203.38.10
    User ubuntu
    Port 22",
}
