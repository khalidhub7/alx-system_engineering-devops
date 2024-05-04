#  create a manifest that kills a process named 'killmenow'
exec {'kill_process':
    path    => ['/bin', '/usr/bin'],
    command => 'pkill killmenow',
}
