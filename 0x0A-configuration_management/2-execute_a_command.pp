#Execute command
exec {
  'pkill':
  command => 'pkill killmenow',
  path    => ['/bin', '/usr/bin'],
}
