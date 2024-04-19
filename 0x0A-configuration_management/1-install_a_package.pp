# Install package
$flask_installed = $facts['os']['flask_installed']

package { 'flask':
  ensure   => '2.1.0',
  provider => 'pip3',
  unless   => $flask_installed,
}
