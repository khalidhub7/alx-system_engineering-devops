exec { "ssh configuration":
	command => "echo -e 'HOST *\n\tPasswordAuthentication no\nHOST ubuntu\n\tHostName 100.27.2.194\n\tPort 22\n\tUser ubuntu\n\tIdentityFile ~/.ssh/school' > ~/.ssh/school",
	path    => ['/bin', '/usr/bin'],
}
