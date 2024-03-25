# Using Puppet, instal
package { 'flask':
  ensure   => 'flask' == '2.1.0',
  provider => 'pip3',
}
