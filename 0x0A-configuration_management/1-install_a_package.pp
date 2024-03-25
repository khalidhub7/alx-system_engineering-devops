#!/usr/bin/pup
# Using Puppet, install
package { 'flask':
  ensure   => '2.1.0',
  provider => 'pip3'
}
