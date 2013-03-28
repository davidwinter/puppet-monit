# puppet-monit

Sets up a simple install of `monit`. With the default `monitrc` it will monitor:

 * if loadavg (1min) > 4 then alert
 * if loadavg (5min) > 3 then alert
 * if memory usage > 75% then alert
 * if cpu usage (user) > 70% then alert
 * if cpu usage (system) > 30% then alert
 * if cpu usage (wait) > 20% then alert
 * if space usage > 75 % then alert

**Note:** In order for alerts to be sent, monit requires an SMTP server. By default, this module will use `localhost` as the SMTP server. See below on how you'd change this with a custom template. If you want a simple SMTP solution, check out my other module [davidwinter/puppet-postfix](https://github.com/davidwinter/puppet-postfix).

## Install

With librarian-puppet, add the following to your Puppetfile:

	mod 'monit',
		:git => 'git://github.com/davidwinter/puppet-monit.git'

Then run `librarian-puppet install`.

## Usage

	class { 'monit':
		notification_email => 'you@domain.com',
		hdd                => 'sda',
		system_hostname    => 'your.hostname.com',
	}

You can override the default contents of `/etc/monit/monitrc` by creating your own template file, and using the `template` parameter:

	class { 'monit':
		...
		template => 'yourconfmodule/monitrc.erb',
		...
	}

## Author

David Winter <i@djw.me>

## Licence

MIT
