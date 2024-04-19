# install package
$flask_version = '2.1.0'

package { 'flask':
  ensure     => $flask_version,
  provider   => 'pip3',
  install_options => ['--upgrade'],  # Upgrade if already installed
  uninstall_options => ['--force'],  # Force uninstall if present but not desired version
  install_only => false,             # Install even if already present at the specified version
  allow_virtual => false,            # Do not use virtual packages
  notify     => Exec['restart_flask'], # Notify a service to restart if Flask is updated
}

exec { 'restart_flask':
  command     => '/path/to/restart_flask_service', # Command to restart Flask service
  refreshonly => true,                             # Only run this command if notified by the package resource
  subscribe   => Package['flask'],                  # Subscribe to changes in the Flask package
}
