class monit (
		$template = 'monit/monitrc.erb',
		$hdd = '/dev/sda',
		$notification_email,
		$system_hostname,
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