#  create a manifest that kills a process named 'killmenow'
exec {'kill_process':
	command => 'pkill',
	path    => ['/bin', '/usr/bin'],
}
