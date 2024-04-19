# install package
$flask_version = '2.1.0'

package { 'flask':
  ensure          => $flask_version,
  provider        => 'pip3',
  install_options => ['--upgrade'],
  uninstall_options => ['--force'],
  install_only    => false,
  allow_virtual   => false,
  notify          => Exec['restart_flask'],
}

exec { 'restart_flask':
  command     => '/path/to/restart_flask_service',
  refreshonly => true,
  subscribe   => Package['flask'],
}
