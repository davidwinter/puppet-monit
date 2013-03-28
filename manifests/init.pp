# == Class: monit
#
# See README.md
#
class monit (
  $template           = 'monit/monitrc.erb',
  $system_hostname    = 'localhost',
  $hdd                = '/dev/sda',
  $notification_email = '',
) {
  package { 'monit':
    ensure => present,
  }

  service { 'monit':
    ensure  => running,
    require => Package['monit'],
  }

  file { '/etc/monit/monitrc':
    ensure  => file,
    content => template($template),
    require => Package['monit'],
    notify  => Service['monit'],
  }
}