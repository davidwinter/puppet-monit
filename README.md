# puppet-monit

	class { 'monit':
		notification_email => 'you@domain.com',
		hdd => 'sda',
		system_hostname => 'your.hostname.com',
	}

You can override the default contents of `/etc/monit/monitrc` by creating your own template file, and using the `template` parameter:

	class { 'monit':
		...
		template => 'yourconfmodule/monitrc.erb',
		...
	}