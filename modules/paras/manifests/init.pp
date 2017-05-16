class paras{
	package { 'apache2':
		ensure => 'installed',
		allowcdrom => 'true',

		}

	file { '/var/www/html/index.html':
		require => Package['apache2'],
		content => "<h1>Hei maailma</h1>\n",
		}

	exec { 'rm /var/www/html/index.html':
		command => 'sudo rm /var/www/html/index.html',
		path => ['/bin', '/usr/bin'],
		require => Package['apache2'],
		}

	file {'/home/xubuntu/public_html/':
		ensure => 'directory',
		}

	file {'/home/xubuntu/public_html/index.html':
		content => "<h1>Heippa Xubu!</h1>\n",
		}

	service {'ufw':
		ensure => 'running',
		enable => 'true',
		status => 'active',
		start => 'true',
		}
	}
